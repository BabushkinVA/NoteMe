//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Vadim on 24.02.24.
//

import UIKit
import SnapKit

@objc protocol MainTabBarViewModelProtocol {
    @objc func addButtonDidTap(sender: UIView)
}

final class MainTabBarVC: UITabBarController {
    
    private var viewModel: MainTabBarViewModelProtocol
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appYellow
        button.setImage(.TabBar.plus, for: .normal)
        button.setImage(.TabBar.plus.withTintColor(.appGrayText), for: .highlighted)
        button.cornerRadius = 25.0
        button.addTarget(viewModel, action: #selector(MainTabBarViewModelProtocol.addButtonDidTap), for: .touchUpInside)
        return button
    }()
//    }().withAction(viewModel,
//                   #selector(MainTabBarViewModelProtocol.addButtonDidTap),
//                   for: .touchUpInside)
    
    init(viewModel: MainTabBarViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        tabBar.tintColor = .appYellow
        tabBar.backgroundColor = .appBlack
        tabBar.unselectedItemTintColor = .appGray
        
        view.addSubview(plusButton)
    }
    
    private func setupConstraints() {
        plusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.tabBar.snp.top)
            make.size.equalTo(50.0)
        }
    }
    
}
