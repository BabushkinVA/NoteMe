//
//  ProfileAdapter.swift
//  NoteMe
//
//  Created by Vadim on 1.03.24.
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
        tableView.tableViewShadow()
        return tableView
    }()
    
    override init() {
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileSettingsCell.self)
        tableView.register(ProfileAccountCell.self)
    }
    
}

extension ProfileAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .account(let email):
            let cell: ProfileAccountCell = tableView.dequeue(at: indexPath)
            cell.setup(email)
            return cell
            
        case .settings(let rows):
            let cell: ProfileSettingsCell = tableView.dequeue(at: indexPath) 
            cell.setup(rows[indexPath.row])
            return cell
        }
    }
    
}

extension ProfileAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
}
