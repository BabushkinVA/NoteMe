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

extension RegisterCoordinator: RegisterCoordinatorProtocol {
//    func openLoginModule() {
//        let coordinator = LoginCoordinator()
//        children.append(coordinator)
//        let vc = coordinator.start()
//        
//        coordinator.onDidFinish = { [weak self] coordinator in
//            self?.children.removeAll { coordinator == $0 }
//            vc.dismiss(animated: true)
//        }
//        
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .flipHorizontal
//        rootVC?.present(vc, animated: true)
//    }
}
