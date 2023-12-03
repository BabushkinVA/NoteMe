//
//  TabBarController.swift
//  NoteMe
//
//  Created by Vadim on 29.11.23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupUI()
    }
    
    private func createNC(title: String,
                          image: UIImage?,
                          vc: UIViewController) -> UINavigationController {
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem.title = title
        nc.tabBarItem.image = image
        
        return nc
    }
    
    private func setupTabBar() {
        let home = 
            createNC(title: "Home", image: UIImage(named: "home"), vc: HomeVC())
        let profile =
        createNC(title: "Profile", image: UIImage(named: "profile"), vc: ProfileVC())
        
        setViewControllers([home, profile], animated: true)
    }
    
    private func setupUI() {
//        tabBar.barTintColor = .appBlack
        tabBar.tintColor = .appYellow
        tabBar.unselectedItemTintColor = .white
    }
    
}
