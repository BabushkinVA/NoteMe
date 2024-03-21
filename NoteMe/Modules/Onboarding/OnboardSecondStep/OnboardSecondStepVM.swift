//
//  OnboardSecondStepVM.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import UIKit

protocol OnboardSecondStepCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

final class OnboardSecondStepVM: OnboardSecondStepViewModelProtocol {

    private weak var coordinator: OnboardSecondStepCoordinatorProtocol?
    
    init(coordinator: OnboardSecondStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func doneDidTap() {
        print("Done tappet")
        ParametersHelper.set(.onboarded, value: true)
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
    
}
