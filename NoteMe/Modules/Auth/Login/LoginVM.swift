//
//  LoginVM.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorProtocol: AnyObject {
    func finish()
    func openRegisterModule()
    func openResetModule()
}

protocol LoginInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol LoginAuthServiceUseCase {
    func login(email: String,
               password: String,
               completion: @escaping (Bool) -> Void)
}

protocol LoginAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

final class LoginVM: LoginViewModelProtocol {
    
    private enum L10n {
    static let alertTitle: String = "auth_alert_title".localized
    static let alertMessage: String = "auth_alert_message".localized
    static let alertOkTitle: String = "auth_alert_okTitle".localized
    }
    
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    private let alertService: LoginAlertServiceUseCase
    
    init(coordinator: LoginCoordinatorProtocol,
         authService: LoginAuthServiceUseCase,
         inputValidator: LoginInputValidatorUseCase,
         alertService: LoginAlertServiceUseCase) {
        self.coordinator = coordinator
        self.authService = authService
        self.inputValidator = inputValidator
        self.alertService = alertService
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard
            checkValidation(email: email), //, password: password),
            let email, let password
        else { return }
        
        authService.login(email: email,
                          password: password) { [weak self] isSuccess in
            print(isSuccess)
            if isSuccess {
                ParametersHelper.set(.authenticated, value: true)
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(title: L10n.alertTitle,
                                             message: L10n.alertMessage,
                                             okTitle: L10n.alertOkTitle)
            }
        }
    }
    
    func newAccountDidTap() {
        print(#function)
        coordinator?.openRegisterModule()
    }
    
    func forgorPasswordDidTap(email: String?) {
        print(#function)
        coordinator?.openResetModule()
    }
    
    private func checkValidation(email: String?) -> Bool { //, password: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
//        let isPasswordValid = inputValidator.validate(password: password)
        
        catchEmailError?(isEmailValid ? nil : "wrong email_loc")
//        catchPasswordError?(isPasswordValid ? nil : "Non-valid password")
        
        return isEmailValid // && isPasswordValid
    }
    
}
