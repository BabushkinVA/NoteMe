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
    
    private enum L10n {
        static let emailError: String = "reg_wrong_e-mail".localized
        static let passwError: String = "reg_wrong_password".localized
        static let matchPasswError: String = "reg_password_not_matches".localized
    }
    
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
        keyboardHelper.onWillShow { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }.onWillHide { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
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
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?, 
                                 password: String?,
                                 repeatPassword: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        delegate?.setEmailError(error: isEmailValid ? nil : L10n.emailError)
        delegate?.setPasswordError(error: isPasswordValid ? nil : L10n.passwError)
        delegate?.setRepeatPasswordError(error: repeatPassword == password ?
                                         nil : L10n.matchPasswError)

        return isEmailValid && isPasswordValid && repeatPassword == password
    }
    
}
