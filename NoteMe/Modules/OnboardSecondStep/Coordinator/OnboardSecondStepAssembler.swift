//
//  OnboardSecondStepAssembler.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

final class OnboardSecondStepAssembler {
    private init() {}
    
    static func make(_ coordinator: OnboardSecondStepCoordinatorProtocol) -> UIViewController {
        let vm = OnboardSecondStepVM(coordinator: coordinator)
        return OnboardSecondStepVC(viewModel: vm)
    }
    
}
