//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit

final class ProfileVC: UIViewController {
    
    private enum L10n {
        static let profileItem: String = "profile_item".localized
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
        view.backgroundColor = .systemGreen
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profileItem,
                                       image: .TabBar.profile,
                                       tag: .zero)
    }
    
}
