//
//  RegisterCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 21.11.23.
//

import UIKit

final class RegisterCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc =  RegisterAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension RegisterCoordinator: RegisterCoordinatorProtocol {}
