//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Vadim on 10.11.23.
//

import UIKit

final class LoginAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let authService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        
        let vm = LoginVM(coordinator: coordinator,
                         authService: authService,
                         alertService: alertService)
        return LoginVC(viewModel: vm, keyboardHelper: KeyboardHelper())
    }
    
}
