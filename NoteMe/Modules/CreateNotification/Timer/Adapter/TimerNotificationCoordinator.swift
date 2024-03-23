//
//  TimerNotificationCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

final class TimerNotificationCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = TimerNotificationAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
    
}

extension TimerNotificationCoordinator: TimerNotificationCoordinatorProtocol {
    func dismissedByUser() {
        onDismissedByUser?(self)
    }
}
