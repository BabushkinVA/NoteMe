//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Vadim on 10.11.23.
//

import UIKit

final class LoginAssembler {
    private init() {}
    
    static func make(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let vm = LoginVM(coordinator: coordinator,
                         authService: TESTAuthService(),
                         inputValidator: InputValidator())
        return LoginVC(viewModel: vm)
    }
}

private class TESTAuthService: LoginAuthServiceUseCase {
    func login(email: String, 
               password: String,
               completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
}
