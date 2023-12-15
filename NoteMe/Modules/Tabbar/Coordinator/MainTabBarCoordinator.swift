//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    override func start() -> UIViewController {
        let tabBar = MainTabBarAssembler.make()
        tabBar.viewControllers = [makeHomeModule(), makeProfileModule()]
        return tabBar
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        children.append(coordinator)
        
        return coordinator.start()
    }
    
    private func makeProfileModule() -> UIViewController {
        let coordinator = ProfileCoordinator()
        children.append(coordinator)
        
        return coordinator.start()
    }
    
}
