//
//  ProfileSections.swift
//  NoteMe
//
//  Created by Vadim on 25.01.24.
//

import UIKit

fileprivate enum L10n {
    
}

enum ProfileSections {
    case account
    case settings([ProfileSectionsRows])
    
    var numberOfRows: Int {
        switch self {
        case .settings(let rows): return rows.count
        default: return 1
        }
    }
    
    var headerText: String {
        switch self {
        case .account: return "account_loc".localized
        case .settings(_): return "profile_loc".localized
        }
    }
}

enum ProfileSectionsRows: CaseIterable {
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
        case .notifications: return "notif_loc".localized
        case .export: return "export_loc".localized
        case .logout: return "logout_loc".localized
        }
    }
    
    var infoText: String? {
        switch self {
        case .export: return "Now_loc".localized
        default: return nil
        }
    }
}
