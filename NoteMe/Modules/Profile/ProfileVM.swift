//
//  ProfileVM.swift
//  NoteMe
//
//  Created by Vadim on 25.01.24.
//

import UIKit

protocol ProfileAdapterProtocol {
//    var didSelectRow: (ProfileSettingsRows) -> Void? { get }
    
    func reloadData(with sections: [ProfileSections])
    func makeTableView() -> UITableView
}

final class ProfileVM: ProfileViewModelProtocol {
    private let adapter: ProfileAdapterProtocol
    
    init(adapter: ProfileAdapterProtocol) {
        self.adapter = adapter
        
        commonInit()
    }

    private var sections: [ProfileSections] {
        return [
            .account("setUserName()"),
            .settings(ProfileSettingsRows.allCases)
        ]
    }
    
    func makeTableView() -> UITableView {
        return adapter.makeTableView()
    }
    
}

//MARK: - Private methods
private extension ProfileVM {
    
    private func commonInit() {
        adapter.reloadData(with: sections)
    }
    
}
