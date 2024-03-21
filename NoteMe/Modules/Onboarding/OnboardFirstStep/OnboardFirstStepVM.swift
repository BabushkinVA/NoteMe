//
//  OnboardFirstStepVM.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import UIKit

protocol OnboardFirstStepCoordinatorProtocol: AnyObject {
    func openNextStep()
}

final class OnboardFirstStepVM: OnboardFirstStepViewModelProtocol {
    
    private weak var coordinator: OnboardFirstStepCoordinatorProtocol?
    
    init(coordinator: OnboardFirstStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func nextDidTap() {
        coordinator?.openNextStep()
    }
    
}
