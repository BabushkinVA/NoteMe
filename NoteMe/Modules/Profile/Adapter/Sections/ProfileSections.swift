//
//  ProfileSections.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit

fileprivate enum L10n {
    static let account: String = "profile_account".localized
    static let settings: String = "profile_settings".localized
    static let notifications: String = "profile_notifications".localized
    static let export: String = "profile_export".localized
    static let logout: String = "profile_logout".localized
}

enum ProfileSections {
    
    case account(String)
    case settings([ProfileSettingsRows])
    
    var numberOfRows: Int {
        switch self {
        case .settings(let rows): return rows.count
        default: return 1
        }
    }
    
    var headerText: String {
        switch self {
        case .account: return L10n.account
        case .settings(_): return L10n.settings
        }
    }
    
}

enum ProfileSettingsRows: CaseIterable {
    
    case notifications
    case export
    case logout
    
    var icon: UIImage {
        switch self {
        case .notifications: return .Profile.notifications
        case .export: return .Profile.export
        case .logout: return .Profile.logout
        }
    }
    
    var title: String {
        switch self {
        case .notifications: return L10n.notifications
        case .export: return L10n.export
        case .logout: return L10n.logout
        }
    }
    
    var infoText: String? {
        switch self {
        case .export: return "Now_test"
        default: return nil
        }
    }
    
}
