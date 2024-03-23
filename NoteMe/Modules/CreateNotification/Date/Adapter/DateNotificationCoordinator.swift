//
//  DateNotificationCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import UIKit

final class DateNotificationCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    var onDismissedByUser: ((Coordinator) -> Void)?
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = DateNotificationAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
}

extension DateNotificationCoordinator: DateNotificationCoordinatorProtocol {
    func dismissedByUser() {
        onDismissedByUser?(self)
    }
}
