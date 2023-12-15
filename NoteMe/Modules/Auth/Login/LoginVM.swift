//
//  LoginVM.swift
//  NoteMe
//
//  Created by Vadim on 10.11.23.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorProtocol: AnyObject {
    func finish()
    func openRegisterModule()
    func openResetModule()
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
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    private let alertService: LoginAlertServiceUseCase
    
    init(coordinator: LoginCoordinatorProtocol,
         authService: LoginAuthServiceUseCase,
         alertService: LoginAlertServiceUseCase) {
        
        self.coordinator = coordinator
        self.authService = authService
        self.alertService = alertService
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard let email, let password
        else { return }
        
        authService.login(email: email,
                          password: password) { [weak self] isSuccess in
            print(isSuccess)
            if isSuccess {
                //FIXME: uncomment
//                ParametersHelper.set(.authenticated, value: true)
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(
                    title: L10n.alertTitle,
                    message: L10n.alertMessage,
                    okTitle: L10n.alertOkTitle)
            }
        }
    }
    
    func newAccountDidTap() {
        coordinator?.openRegisterModule()
    }
    
    func forgotPasswordDidTap(email: String?) {
        coordinator?.openResetModule()
    }
    
}
