//
//  ProfileVM.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit

protocol ProfileAdapterProtocol {
//    var didSelectRow: ((ProfileSettingsRows) -> Void)?
    
    func reloadData(with sections: [ProfileSections])
    func makeTableView() -> UITableView
}

final class ProfileVM: ProfileViewModelProtocol {
    
    private let adapter: ProfileAdapterProtocol
    
    private var sections: [ProfileSections] {
        return [
            .account("Set user email"),
            .notifications,
            .settings(ProfileSettingsRows.allCases)
        ]
    }
    
    init(adapter: ProfileAdapterProtocol) {
        self.adapter = adapter
        
        commonInit()
    }
    
    private func commonInit() {
        adapter.reloadData(with: sections)
    }
    
    func makeTableView() -> UITableView {
        return adapter.makeTableView()
    }
    
}
