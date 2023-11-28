//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Vadim on 14.11.23.
//

import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    func finish()
}

protocol RegisterInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol RegisterPresenterDelegate: AnyObject {
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
}

protocol RegisterKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
    
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

protocol RegisterAuthServiceUseCase {
    func register(email: String,
               password: String,
               repeatPassword: String,
               completion: @escaping (Bool) -> Void)
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    weak var delegate: RegisterPresenterDelegate?
    
    private weak var coordinator: RegisterCoordinatorProtocol?
    
    private let keyboardHelper: KeyboardHelper
    private let registerService: RegisterAuthServiceUseCase
    private let inputValidator: RegisterInputValidatorUseCase
    
    init(coordinator: RegisterCoordinatorProtocol,
         keyboardHelper: KeyboardHelper,
         registerService: RegisterAuthServiceUseCase,
         inputValidator: RegisterInputValidatorUseCase) {
        self.coordinator = coordinator
        self.keyboardHelper = keyboardHelper
        self.registerService = registerService
        self.inputValidator = inputValidator
        
        bind()
    }
    
    private func bind() {
        keyboardHelper
            .onWillShow { [weak delegate] in
            delegate?.keyboardFrameChanged($0)
        }.onWillHide { [weak delegate] in
            delegate?.keyboardFrameChanged($0)
        }
    }

    func registerDidTap(email: String?,
                        password: String?,
                        repeatPassword: String?) {
        guard
            checkValidation(email: email,
                            password: password,
                            repeatPassword: repeatPassword),
            let email, let password, let repeatPassword  
        else { return }
        registerService.register(email: email,
                             password: password,
                             repeatPassword: repeatPassword) { [weak coordinator] isSuccess in
            print(isSuccess)
            coordinator?.finish()
        }
    }
    
    func haveAccountDidTap() {
//        coordinator?.openLoginModule()
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?, 
                                 password: String?,
                                 repeatPassword: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        delegate?.setEmailError(error: isEmailValid ? nil : "reg_wrong_e-mail".localized)
        delegate?.setPasswordError(error: isPasswordValid ? nil : "reg_wrong_password".localized)
        delegate?.setRepeatPasswordError(error: repeatPassword == password ?
                                  nil : "reg_password_not_matches".localized)

        return isEmailValid && isPasswordValid && repeatPassword == password
    }
    
}
