//
//  HomeVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class HomeVC: UIViewController {
    
    private enum L10n {
        static let homeItem: String = "home_item".localized
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.homeItem,
                                       image: .TabBar.home,
                                       tag: .zero)
    }
    
}
