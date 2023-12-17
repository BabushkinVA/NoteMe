//
//  OnboardFirstStepVM.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

protocol OnboardFirstStepCoordinatorProtocol: AnyObject {
    func openNextStep()
}

final class OnboardFirstStepVM: OnboardFirstStepViewModelProtocol {
    
    private weak var coordinator: OnboardFirstStepCoordinatorProtocol?
    
    init(coordinator: OnboardFirstStepCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func nextDidTap() {
        coordinator?.openNextStep()
    }
    
}
