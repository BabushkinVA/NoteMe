//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .appYellow
        tabBar.backgroundColor = .appBlack
        tabBar.unselectedItemTintColor = .appGray
    }
    
}
