//
//  TimerNotificationVM.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import Foundation

protocol TimerNotificationCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

final class TimerNotificationVM: TimerNotificationViewModelProtocol {

    private weak var coordinator: TimerNotificationCoordinatorProtocol?
    
    init(coordinator: TimerNotificationCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func createDidTap() {
        print(#function)
        print(1)
    }
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
    
}
