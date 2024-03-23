//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 24.02.24.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let tabBar = MainTabBarAssembler.make(coordinator: self)
        tabBar.viewControllers = [makeHomeModule(), makeProfileModule()]
//        tabBar.selectedIndex = 1
        rootVC = tabBar
        return tabBar
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        children.append(coordinator)
        return coordinator.start()
    }
    
    private func makeProfileModule() -> UIViewController {
//        let coordinator = ProfileCoordinator()
//        children.append(coordinator)
//        let vc = coordinator.start()
//        coordinator.onDidFinish = { [weak self] coordinator in
//            self?.children.removeAll()
//            self?.rootVC?.dismiss(animated: true)
//            self?.finish()
//        }
//        return vc
        let coordinator = ProfileCoordinator()
        children.append(coordinator)
        return coordinator.start()
    }
    
}

extension MainTabBarCoordinator: MainTabBarCoordinatorProtocol {
    func showMenu(sender: UIView, delegate: MenuPopoverDelegate) {
        print(#function)
        let menu = MenuPopoverBuilder.buildAddMenu(delegate: delegate,
                                                   sourceView: sender)
        rootVC?.present(menu, animated: true)
    }
    
    func openNewDateNotification() {
        let coordinator = DateNotificationCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }
    
    func openNewLocationNotification() {
        let coordinator = LocationNotificationCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }
    
    func openNewTimerNotification() {
        let coordinator = TimerNotificationCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }
    
}
