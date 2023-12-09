//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Vadim on 19.11.23.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make(coordinator: ResetCoordinatorProtocol) -> UIViewController {
        let vm = ResetVM(coordinator: coordinator,
                         resetService: AuthService(),
                         inputValidator: InputValidator())
        return ResetVC(viewModel: vm)
    }
}
