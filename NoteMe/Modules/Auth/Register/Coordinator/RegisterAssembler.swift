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
                                          keyboardHelper: KeyboardHelper(),
                                          registerService: AuthService(),
                                          inputValidator: InputValidator())
        let vc = RegisterVC(presenter: presenter)
        
        presenter.delegate = vc
        
        return vc
    }

}
