//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit
import SnapKit

final class ProfileVC: UIViewController {
    
    private enum L10n {
        static let profileItem: String = "profile_item".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    
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
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profileItem,
                                       image: .TabBar.profile,
                                       tag: .zero)
    }
    
}
