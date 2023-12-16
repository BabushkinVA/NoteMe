//
//  MainTabBarAssembler.swift
//  NoteMe
//
//  Created by Vadim on 3.12.23.
//

import UIKit

final class MainTabBarAssembler {
    private init() {}

    static func make() -> UITabBarController {
        let tabBar = MainTabBarVC() 
        return tabBar
    }
    
}
