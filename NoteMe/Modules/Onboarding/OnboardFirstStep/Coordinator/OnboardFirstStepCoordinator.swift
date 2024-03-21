//
//  OnboardFirstStepCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import UIKit

final class OnboardFirstStepCoordinator: Coordinator {
    
    private var rootNC: UINavigationController?
    
    override func start() -> UIViewController {
        let vc = OnboardFirstStepAssembler.make(self)
        let nc = UINavigationController(rootViewController: vc)
        self.rootNC = nc
        return nc
    }
    
}

extension OnboardFirstStepCoordinator: OnboardFirstStepCoordinatorProtocol {
    func openNextStep() {
        let coordinator = OnboardSecondStepCoordinator()
        children.append(coordinator)
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll() { $0 == coordinator }
            self?.finish()
        }
        
        coordinator.onDismissedByUser = { [weak self] coordinator in
            self?.children.removeAll() { $0 == coordinator }
        }
        
        let vc = coordinator.start()
        rootNC?.pushViewController(vc, animated: true)
    }
    
}
