//
//  MainTabBarVM.swift
//  NoteMe
//
//  Created by Vadim on 15.03.24.
//

import UIKit

protocol MainTabBarCoordinatorProtocol: AnyObject {
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate)
//    func openNewDateNotification()
//    func openNewLocationNotification()
//    func openNewTimerNotification()
}

final class MainTabBarVM: MainTabBarViewModelProtocol {
    
    private weak var coordinator: MainTabBarCoordinatorProtocol?
    
    init(coordinator: MainTabBarCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func addButtonDidTap(sender: UIView) {
        coordinator?.showMenu(sender: sender, delegate: self)
    }
    
}

extension MainTabBarVM: MenuPopoverDelegate {
    func didSelect(action: MenuPopoverVC.Action) {
//        switch action {
//        case .calendar: coordinator?.openNewDateNotification()
//        case .location: coordinator?.openNewLocationNotification()
//        case .timer: coordinator?.openNewTimerNotification()
//        default: break
//        }
    }
}
