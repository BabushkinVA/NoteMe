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
        static let accountLabel: String = "account_label".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var accountLabel: UILabel = 
        .regularBoldLabelStyle(L10n.accountLabel)
    
    private lazy var accountInfoView: UIView = .shadowStyle()
    
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
//        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        
        contentView.addSubview(accountLabel)
        contentView.addSubview(accountInfoView)
    }
    
//    private func setupConstraints() {
//        contentView.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview()
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.bottom.equalTo(view.snp.bottom)
//        }
//        
//        accountLabel.snp.makeConstraints { make in
//            make.top.left.equalToSuperview().inset(20.0)
//        }
//        
//        accountInfoView.snp.makeConstraints { make in
//            make.horizontalEdges.equalToSuperview().inset(16.0)
//            make.top.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
//        }
//    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profileItem,
                                       image: .TabBar.profile,
                                       tag: .zero)
    }
    
}
