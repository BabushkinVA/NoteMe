//
//  ResetVM.swift
//  NoteMe
//
//  Created by Vadim on 19.11.23.
//

import UIKit

protocol ResetCoordinatorProtocol: AnyObject {
    func finish()
}

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

protocol ResetAuthServiceUseCase {
    func resetPassword(email: String,
                       completion: @escaping (Bool) -> Void)
}

protocol ResetAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

final class ResetVM: ResetViewModelProtocol {
    
    private enum L10n {
        static let emailError: String = "res_wrong_e-mail".localized
        static let alertTitle: String = "res_alert_title".localized
        static let alertMessage: String = "res_alert_message".localized
        static let alertOkTitle: String = "res_alert_okTitle".localized
    }
    
    var catchEmailError: ((String?) -> Void)?
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    private let resetService: ResetAuthServiceUseCase
    private let inputValidator: ResetInputValidatorUseCase
    private let alertService: ResetAlertServiceUseCase
    
    init(coordinator: ResetCoordinatorProtocol,
         resetService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase,
         alertService: ResetAlertServiceUseCase) {
        self.coordinator = coordinator
        self.resetService = resetService
        self.inputValidator = inputValidator
        self.alertService = alertService
    }
    
    func resetDidTap(email: String?) {
        guard
            checkValidation(email: email),
            let email
        else { return }
        resetService.resetPassword(email: email) { [weak self] isSuccess in
            print(isSuccess)
            
            if isSuccess {
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(
                    title: L10n.alertTitle,
                    message: L10n.alertMessage,
                    okTitle: L10n.alertOkTitle)
            }
        }
    }
    
    func cancelDidTap() {
        print(#function)
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : L10n.emailError)
        
        return isEmailValid
    }
    
}
