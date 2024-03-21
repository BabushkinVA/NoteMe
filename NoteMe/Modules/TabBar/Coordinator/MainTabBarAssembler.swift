//
//  MainTabBarAssembler.swift
//  NoteMe
//
//  Created by Vadim on 24.02.24.
//

import UIKit

final class MainTabBarAssembler {
    private init() {}
    
    static func make(coordinator: MainTabBarCoordinator) -> UITabBarController {
        let vm = MainTabBarVM(coordinator: coordinator)
        return MainTabBarVC(viewModel: vm)
    }
    
}
