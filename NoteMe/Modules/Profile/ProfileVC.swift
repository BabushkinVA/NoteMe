//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Vadim on 28.02.24.
//

import UIKit

protocol ProfileViewModelProtocol {
    func makeTableView() -> UITableView
}

final class ProfileVC: UIViewController {
    
    private enum L10n {
        static let profile: String = "profile_item".localized
    }
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var tableView: UITableView = viewModel.makeTableView()
    
    private let viewModel: ProfileViewModelProtocol

    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
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
        contentView.addSubview(tableView)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        tableView.snp.makeConstraints { make in
            tableView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(16.0)
                make.bottom.horizontalEdges.equalToSuperview()
            }
        }
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profile,
                                       image: .TabBar.profile,
                                       tag: .zero)
    }
    
}

