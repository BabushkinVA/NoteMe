//
//  ResetVM.swift
//  NoteMe
//
//  Created by Vadim on 19.11.23.
//

import UIKit

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

protocol ResetAuthServiceUseCase {
    func resetPassword(email: String,
               completion: @escaping (Bool) -> Void)
}

final class ResetVM: ResetViewModelProtocol {
    var catchEmailError: ((String?) -> Void)?
    
    private let resetService: ResetAuthServiceUseCase
    private let inputValidator: ResetInputValidatorUseCase
    
    init(resetService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase) {
        self.resetService = resetService
        self.inputValidator = inputValidator
    }
    
    func resetDidTap(email: String?) {
        guard 
            checkValidation(email: email),
                let email 
        else { return }
        resetService.resetPassword(email: email) { isSuccess in
            print(isSuccess)
        }
    }
    
    private func checkValidation(email: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : "res_wrong_e-mail".localized)
        
        return isEmailValid
    }
    
}
