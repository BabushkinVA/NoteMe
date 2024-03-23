//
//  ProfileSections.swift
//  NoteMe
//
//  Created by Vadim on 29.02.24.
//

import UIKit

fileprivate enum L10n {
    static let account: String = "profile_account".localized
    static let notifications: String = "profile_notifications".localized
    static let settings: String = "profile_settings".localized
    static let settingsNotifications: String = "profile_settings_notifications".localized
    static let settingsExport: String = "profile_settings_export".localized
    static let settingsLogout: String = "profile_settings_logout".localized
}

enum ProfileSections {
    
    case account(String)
    case notifications
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
        case .notifications: return L10n.notifications
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
        case .notifications: return L10n.settingsNotifications
        case .export: return L10n.settingsExport
        case .logout: return L10n.settingsLogout
        }
    }
    
    var infoText: String? {
        switch self {
        case .export: return "Now_test"
        default: return nil
        }
    }
    
}
