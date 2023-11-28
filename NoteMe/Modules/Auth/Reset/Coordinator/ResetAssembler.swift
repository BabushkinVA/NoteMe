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
                         resetService: TESTResetAuthService(),
                         inputValidator: InputValidator())
        return ResetVC(viewModel: vm)
    }
}

private class TESTResetAuthService: ResetAuthServiceUseCase {
    func resetPassword(email: String, 
                       completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
