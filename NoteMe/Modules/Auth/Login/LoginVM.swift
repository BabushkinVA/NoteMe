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
    func showAlert(_ alert: UIAlertController)
}

protocol LoginAuthServiceUseCase {
    func login(email: String,
               password: String,
               completion: @escaping (Bool) -> Void)
}

final class LoginVM: LoginViewModelProtocol {
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    
    init(coordinator: LoginCoordinatorProtocol,
         authService: LoginAuthServiceUseCase) {
        
        self.coordinator = coordinator
        self.authService = authService
}

    func loginDidTap(email: String?, password: String?) {
        guard let email, let password
        else { return }
        
        authService.login(email: email,
                          password: password) { [weak coordinator] isSuccess in
            print(isSuccess)
            if isSuccess {
                //FIXME: uncomment
//                ParametersHelper.set(.authenticated, value: true)
                coordinator?.finish()
            } else {
                let alertVC = AlertBuilder.build(
                    title: "auth_alert_title".localized,
                    message: "auth_alert_message".localized,
                    okTitle: "auth_alert_okTitle".localized)
                
                coordinator?.showAlert(alertVC)
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
