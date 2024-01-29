//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Vadim on 19.11.23.
//

import UIKit

final class ResetAssembler {
    private init() {}
    
    static func make(container: Container,
                     coordinator: ResetCoordinatorProtocol) -> UIViewController {
        
        let alertService: AlertService = container.resolve()
        let resetService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        
        let vm = ResetVM(coordinator: coordinator,
                         resetService: resetService,
                         inputValidator: inputValidator,
                         alertService: alertService)
        return ResetVC(viewModel: vm)
    }
}
