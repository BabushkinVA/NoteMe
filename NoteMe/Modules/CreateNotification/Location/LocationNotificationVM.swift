//
//  LocationNotificationVM.swift
//  NoteMe
//
//  Created by Vadim on 22.03.24.
//

import UIKit

protocol LocationNotificationCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
    func openMapScreen()
}

final class LocationNotificationVM: LocationNotificationViewModelProtocol {
    func mapImageViewDidTap() {
        coordinator?.openMapScreen()
    }
    
    
    private weak var coordinator: LocationNotificationCoordinatorProtocol?
    
    init(coordinator: LocationNotificationCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func cancelDidTap() {
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
    
    func createDidTap() {
        print(1)
    }
}
