//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Vadim on 19.02.24.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: ResetCoordinatorProtocol) -> UIViewController {
        let inputValidator: InputValidator = container.resolve()
        let resetService: AuthService = container.resolve()
        let alertService: AlertService = container.resolve()
        
        let vm = ResetVM(coordinator: coordinator,
                         inputValidator: inputValidator,
                         resetService: resetService,
                         alertService: alertService)
        return ResetVC(viewModel: vm)
    }
}
