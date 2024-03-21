//
//  ResetVM.swift
//  NoteMe
//
//  Created by Vadim on 19.02.24.
//

import Foundation

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
    
    private let inputValidator: ResetInputValidatorUseCase
    private let resetService: ResetAuthServiceUseCase
    private let alertService: ResetAlertServiceUseCase
    
    init(coordinator: ResetCoordinatorProtocol,
         inputValidator: ResetInputValidatorUseCase,
         resetService: ResetAuthServiceUseCase,
         alertService: ResetAlertServiceUseCase) {
        self.coordinator = coordinator
        self.inputValidator = inputValidator
        self.resetService = resetService
        self.alertService = alertService
    }
    
    func resetDidTap(email: String?) {
        guard
            checkValidation(email: email),
            let email
        else { return }
        resetService.resetPassword(email: email) { [weak coordinator] isSuccess in
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
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : L10n.emailError)
        
        return isEmailValid
    }
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
}
