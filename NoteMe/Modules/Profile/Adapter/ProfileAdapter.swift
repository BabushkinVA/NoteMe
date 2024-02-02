//
//  ProfileAdapter.swift
//  NoteMe
//
//  Created by Vadim on 2.02.24.
//

import UIKit

final class ProfileAdapter: NSObject {
    
    var sections: [ProfileSections] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.addShadow()
        return tableView
    }()
    
    override init() {
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileSettingsCell.self,
                           forCellReuseIdentifier: "\(ProfileSettingsCell.self)")
        tableView.register(ProfileAccountCell.self,
                           forCellReuseIdentifier: "\(ProfileAccountCell.self)")

    }
    
}

extension ProfileAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .account(let email):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfileAccountCell.self)",
                for: indexPath) as? ProfileAccountCell
            cell?.setup(email)
            return cell ?? UITableViewCell()
            
        case .settings(let rows):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(ProfileSettingsCell.self)",
                for: indexPath) as? ProfileSettingsCell
            cell?.setup(rows[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
        
}

extension ProfileAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = sections[section]
        let header = ProfileTableViewHeader()
        header.text = section.headerText
        return header
    }
}

extension ProfileAdapter: ProfileAdapterProtocol {
    
    func reloadData(with sections: [ProfileSections]) {
        self.sections = sections
    }
    
    func makeTableView() -> UITableView {
        return tableView
    }
    
}
