//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import UIKit

final class LoginAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let authService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let alertService: AlertService = container.resolve()
        
        let vm = LoginVM(coordinator: coordinator,
                         authService: authService,
                         inputValidator: inputValidator,
                         alertService: alertService)
        
        return LoginVC(viewModel: vm)
    }
}
