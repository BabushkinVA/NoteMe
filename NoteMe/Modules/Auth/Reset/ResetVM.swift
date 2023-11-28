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

final class ResetVM: ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)?
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    private let resetService: ResetAuthServiceUseCase
    private let inputValidator: ResetInputValidatorUseCase
    
    init(coordinator: ResetCoordinatorProtocol,
         resetService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase) {
        self.coordinator = coordinator
        self.resetService = resetService
        self.inputValidator = inputValidator
    }
    
    func resetDidTap(email: String?) {
        guard 
            checkValidation(email: email),
                let email 
        else { return }
        resetService.resetPassword(email: email) { [weak coordinator] isSuccess in
            print(isSuccess)
            coordinator?.finish()
        }
    }
    
    func cancelDidTap() {
        print(#function)
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : "res_wrong_e-mail".localized)
        
        return isEmailValid
    }
    
}
