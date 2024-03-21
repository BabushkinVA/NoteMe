//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Vadim on 17.02.24.
//

import UIKit

protocol RegisterCoordinatorProtocol: AnyObject {
    func finish()
}

protocol RegisterInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol RegisterAuthServiceUseCase {
    func register(email: String,
                  password: String,
                  repeatPassword: String,
                  completion: @escaping (Bool) -> Void)
}

protocol RegisterKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
    
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

protocol RegisterPresenterDelegate: AnyObject {
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
}

protocol RegisterAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    private enum L10n {
        static let emailError: String = "reg_wrong_e-mail".localized
        static let passwError: String = "reg_wrong_password".localized
        static let matchPasswError: String = "reg_password_not_matches".localized
        static let alertTitle: String = "reg_alert_title".localized
        static let alertMessage: String = "reg_alert_message".localized
        static let alertOkTitle: String = "reg_alert_okTitle".localized
    }
    
    weak var delegate: RegisterPresenterDelegate?
    
    private weak var coordinator: RegisterCoordinatorProtocol?
    
    private let keyboardHelper: KeyboardHelper
    private let authService: RegisterAuthServiceUseCase
    private let inputValidator: RegisterInputValidatorUseCase
    private let alertService: RegisterAlertServiceUseCase
    
    init(coordinator: RegisterCoordinatorProtocol,
         keyboardHelper: KeyboardHelper,
         authService: RegisterAuthServiceUseCase,
         inputValidator: RegisterInputValidatorUseCase,
         alertService: RegisterAlertServiceUseCase) {
        self.coordinator = coordinator
        self.keyboardHelper = keyboardHelper
        self.authService = authService
        self.inputValidator = inputValidator
        self.alertService = alertService
        
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
        
        authService.register(email: email,
                          password: password,
                             repeatPassword: repeatPassword) { [weak coordinator] isSuccess in
            print(isSuccess)
            if isSuccess {
                coordinator?.finish()
            } else {
                self.alertService.showAlert(title: L10n.alertTitle,
                                            message: L10n.alertMessage,
                                            okTitle: L10n.alertOkTitle)
            }
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
        delegate?.setRepeatPasswordError(error: repeatPassword == password ? nil : L10n.matchPasswError)
        
        return isEmailValid && isPasswordValid && repeatPassword == password
    }
    
}
