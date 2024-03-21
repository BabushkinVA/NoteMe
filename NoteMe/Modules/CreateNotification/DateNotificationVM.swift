//
//  DateNotificationVM.swift
//  NoteMe
//
//  Created by Vadim on 4.03.24.
//

import Foundation

protocol DateNotificationCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

final class DateNotificationVM: DateNotificationViewModelProtocol {

    private weak var coordinator: DateNotificationCoordinatorProtocol?
    
    init(coordinator: DateNotificationCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func cancelDidTap() {
        print(#function)
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
}
