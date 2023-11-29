//
//  OnboardSecondStepVM.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

protocol OnboardSecondStepCoordinatorProtocol: AnyObject {
    func openNextStep()
}

final class OnboardSecondStepVM: OnboardSecondStepViewModelProtocol {
    
    private weak var coordinator: OnboardSecondStepCoordinatorProtocol?
    
    init(coordinator: OnboardSecondStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func doneDidTap() {
        coordinator?.openNextStep()
    }
    
    func dismissedByUser() {
//        coordinator?.dismissedByUser()
    }
    
}
