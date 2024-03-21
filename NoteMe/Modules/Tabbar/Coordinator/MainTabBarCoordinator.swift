//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

//final class MainTabBarCoordinator: Coordinator {
//    
//    override func start() -> UIViewController {
//        let tabBar = MainTabBarAssembler.make()
//        tabBar.viewControllers = [makeProfileModule(), makeHomeModule()]
//        return tabBar
//    }
//    
//    private func makeHomeModule() -> UIViewController {
//        let coordinator = HomeCoordinator()
//        children.append(coordinator)
//        
//        return coordinator.start()
//    }
//    
//    private func makeProfileModule() -> UIViewController {
//        let coordinator = ProfileCoordinator()
//        children.append(coordinator)
//        
//        return coordinator.start()
//    }
//    
//}

//extension MainTabBarCoordinator: MainTabBarCoordinatorProtocol {
//    func showMenu(sender: UIView, delegate: MenuPopoverDelegate) {
//        print(1)
//    }
//    
//    func openNewDateNotification() {
//        print(1)
//    }
//    
//    func openNewLocationNotification() {
//        print(1)
//    }
//    
//    func openNewTimerNotification() {
//        print(1)
//    }
    
//    func showMenu(sender: UIView, delegate: MenuPopoverDelegate) {
//        let menu = MenuPopoverBuilder.buildAddMenu(delegate: delegate, sourceView: sender)
//        rootVC?.present(menu, animated: true)
//    }
    
    
//}
