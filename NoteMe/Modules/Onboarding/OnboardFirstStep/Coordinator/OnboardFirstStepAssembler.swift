//
//  OnboardFirstStepAssembler.swift
//  NoteMe
//
//  Created by Vadim on 28.11.23.
//

import UIKit

final class OnboardFirstStepAssembler {
    private init() {}
    
    static func  make(_ coordinator: OnboardFirstStepCoordinatorProtocol) -> 
        UIViewController {
        let vm = OnboardFirstStepVM(coordinator: coordinator)
        return OnboardFirstStepVC(viewModel: vm)
    }
}
