//
//  OnboardSecondStepCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

final class OnboardSecondStepCoordinator: Coordinator {
    
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    private var rootNC: UINavigationController?

    override func start() -> UIViewController {
        return OnboardSecondStepAssembler.make(self)
    }
}

extension OnboardSecondStepCoordinator: OnboardSecondStepCoordinatorProtocol {
    
    func onboardingFinished() {
//        
//        let coordinator = MainTabBarCoordinator()
//        
//        children.append(coordinator)
//        let vc = coordinator.start()
//        
//        coordinator.onDidFinish = { [weak self] coordinator in
//            self?.children.removeAll { $0 == coordinator }
//            vc.dismiss(animated: true)
//        }
//        
//        rootNC?.pushViewController(vc, animated: true)
        
        

    }
    
    func dismissedByUser() {
        onDismissedByUser?(self)
    }

}
