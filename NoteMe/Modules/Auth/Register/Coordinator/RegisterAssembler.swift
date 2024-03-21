//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Vadim on 17.02.24.
//

import UIKit

final class RegisterAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let keyboardHelper: KeyboardHelper = container.resolve()
        let authService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let alertService: AlertService = container.resolve()
        
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: keyboardHelper,
                                          authService: authService,
                                          inputValidator: inputValidator,
                                          alertService: alertService)
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }
    
}
