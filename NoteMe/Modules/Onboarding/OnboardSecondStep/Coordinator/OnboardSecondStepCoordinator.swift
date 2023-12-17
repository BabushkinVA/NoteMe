//
//  OnboardSecondStepCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

final class OnboardSecondStepCoordinator: Coordinator {
    
    var onDismissedByUser: ((Coordinator) -> Void)?

    override func start() -> UIViewController {
        return OnboardSecondStepAssembler.make(self)
    }
}

extension OnboardSecondStepCoordinator: OnboardSecondStepCoordinatorProtocol {
    
    func dismissedByUser() {
        onDismissedByUser?(self)
    }

}
