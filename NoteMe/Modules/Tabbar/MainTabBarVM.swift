//
//  MainTabBarVM.swift
//  NoteMe
//
//  Created by Vadim on 27.02.24.
//

import UIKit

protocol MainTabBarCoordinatorProtocol {
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate)
    func openNewDateNotification()
    func openNewLocationNotification()
    func openNewTimerNotification()
}


final class MainTabBarVM: MainTabBarViewModelProtocol {
    
    func addButtonDidTap(sender: UIView) {
        coordinator?.showMenu(sender: sender)
    }
    
}

extension MainTabBarVM: MenuPopoverDelegate {
    func didSelect(action: MenuPopoverVC.Action) {
        switch action {
        case .calendar: coordinator.openNewDateNotification
        case .timer: coordinator.openNewTimerNotification
        case .location: coordinator.openNewLocationNotification
        default: break
        }
    }
}
