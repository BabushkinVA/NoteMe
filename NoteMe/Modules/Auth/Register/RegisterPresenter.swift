//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Vadim on 14.11.23.
//

import UIKit

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

protocol RegisterAuthServiceUseCase {
    func register(email: String,
               password: String,
               repeatPassword: String,
               completion: @escaping (Bool) -> Void)
}

final class RegisterPresenter: RegisterPresenterProtocol {
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    var catchRepeatPasswordError: ((String?) -> Void)?
    
    weak var delegate: RegisterPresenterDelegate?
    
    private let keyboardHelper: KeyboardHelper
    private let registerService: RegisterAuthServiceUseCase
    private let inputValidator: RegisterInputValidatorUseCase
    
    init(keyboardHelper: KeyboardHelper,
         registerService: RegisterAuthServiceUseCase,
         inputValidator: RegisterInputValidatorUseCase) {
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
                             repeatPassword: repeatPassword) { isSuccess in
            print(isSuccess)
        }
        
    }
    
    func haveAccountDidTap() {
        
    }
    
    private func checkValidation(email: String?, 
                                 password: String?,
                                 repeatPassword: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        let isRepeatPasswordValid = inputValidator.validate(password: repeatPassword)
        
        catchEmailError?(isEmailValid ? nil : "reg_wrong_e-mail".localized)
        catchPasswordError?(isPasswordValid ? nil : "reg_wrong_password".localized)
        catchRepeatPasswordError?(isRepeatPasswordValid ? nil : "reg_password_not_matches".localized)
        
        return isEmailValid && isPasswordValid && isRepeatPasswordValid
    }
    
}
