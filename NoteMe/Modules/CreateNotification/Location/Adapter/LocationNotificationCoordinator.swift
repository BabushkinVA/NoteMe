//
//  LocationNotificationCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

final class LocationNotificationCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = LocationNotificationAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension LocationNotificationCoordinator: LocationNotificationCoordinatorProtocol {
    func openMapScreen() {
        let coordinator = MapCoordinator()
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        rootVC?.present(vc, animated: true)
    }
    
    func dismissedByUser() {
        onDismissedByUser?(self)
    }
}

