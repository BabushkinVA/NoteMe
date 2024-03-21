//
//  OnboardSecondStepAssembler.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import UIKit

final class OnboardSecondStepAssembler {
    private init() {}
    
    static func make(_ coordinator: OnboardSecondStepCoordinatorProtocol) -> UIViewController {
        let vm = OnboardSecondStepVM(coordinator: coordinator)
        return OnboardSecondStepVC(viewModel: vm)
    }
    
}
