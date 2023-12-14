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
                         authService: AuthService(), 
                         alertService: AlertService.current)
        return LoginVC(viewModel: vm, keyboardHelper: KeyboardHelper())
    }
    
}
