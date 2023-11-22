//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Vadim on 14.11.23.
//

import UIKit


final class RegisterAssembler {
    private init() {}
    
    static func make(coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: .init(),
                                          registerService: TESTRegisterAuthService(),
                                          inputValidator: InputValidator())
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }
    
    private class TESTRegisterAuthService: RegisterAuthServiceUseCase {
        func register(email: String, 
                      password: String,
                      repeatPassword: String,
                      completion: @escaping (Bool) -> Void) {
            completion(true)
        }
    }

}
