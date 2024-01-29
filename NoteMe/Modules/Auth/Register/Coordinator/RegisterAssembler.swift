//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Vadim on 14.11.23.
//

import UIKit


final class RegisterAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: RegisterCoordinatorProtocol) -> UIViewController {
                         
        let keyboardHelper: KeyboardHelper = container.resolve()
        let registerService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
                         
                         
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: keyboardHelper,
                                          registerService: registerService,
                                          inputValidator: inputValidator)
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }

}
