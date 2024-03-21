//
//  ResetCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import UIKit

final class ResetCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc =  ResetAssembler.make(container: container, coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension ResetCoordinator: ResetCoordinatorProtocol {}
