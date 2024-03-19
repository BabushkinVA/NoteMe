//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Vadim on 14.12.23.
//

import UIKit
import SnapKit

protocol ProfileViewModelProtocol {
    func makeTableView() -> UITableView
}

final class ProfileVC: UIViewController {
    private enum L10n {
        static let profileItem: String = "profile_item".localized
    }
    
    private var viewModel: ProfileViewModelProtocol
    
    private lazy var contentView: UIView = .contentViewStyle()
    private lazy var tableView: UITableView = viewModel.makeTableView()
    
    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
//        bind()
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
            make.horizontalEdges.equalToSuperview()
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(150.0)
        }
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profileItem,
                                       image: .TabBar.profile,
                                       tag: .zero)
    }
    
}

//extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.sections.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sectionType = viewModel.sections[section]
//        return sectionType.numberOfRows
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let section = viewModel.sections[indexPath.section]
//        switch section {
//        case .account(let email):
//            let cell = tableView.dequeueReusableCell(
//                withIdentifier: "\(ProfileAccountCell.self)",
//                for: indexPath) as? ProfileAccountCell
//            cell?.setup(email)
//            return cell ?? UITableViewCell()
//            
//        case .settings(let rows):
//            let cell = tableView.dequeueReusableCell(
//                withIdentifier: "\(ProfileSettingsCell.self)",
//                for: indexPath) as? ProfileSettingsCell
//            cell?.setup(rows[indexPath.row])
//            return cell ?? UITableViewCell()
//        }
//    }
        
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionType = viewModel.sections[section]
//        let header = ProfileTableViewHeader()
//        header.text = section.headerText
//        return header
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
////        viewModel.buttons[indexPath.row].action()
//    }
//
//}
