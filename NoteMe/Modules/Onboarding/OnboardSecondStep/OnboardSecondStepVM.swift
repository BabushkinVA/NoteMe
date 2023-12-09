//
//  OnboardSecondStepVM.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

protocol OnboardSecondStepCoordinatorProtocol: AnyObject {
//    func finish()
    func onboardingFinished()
    func dismissedByUser()
}

final class OnboardSecondStepVM: OnboardSecondStepViewModelProtocol {
    
    private weak var coordinator: OnboardSecondStepCoordinatorProtocol?
    
    init(coordinator: OnboardSecondStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func doneDidTap() {
        print("Done tapped")
//        ParametersHelper.set(.onboarded, value: true)
        coordinator?.onboardingFinished()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
    
}
