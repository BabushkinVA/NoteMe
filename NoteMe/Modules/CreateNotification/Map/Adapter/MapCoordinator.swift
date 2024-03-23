//
//  MapCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 23.03.24.
//

import UIKit

final class MapCoordinator: Coordinator {

    private var rootVC: UIViewController?
//    private let container: Container
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    override func start() -> UIViewController {
        let vc = MapAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension MapCoordinator: MapCoordinatorProtocol {
    func dismissedByUser() {
        onDismissedByUser?(self)
    }
}
