//
//  ParametersHelper.swift
//  NoteMe
//
//  Created by Vadim on 21.02.24.
//

import Foundation

final class ParametersHelper {
    private init() {}
    
    enum ParameterKey: String {
        case authenticated
        case onboarded
    }
    
    private static var ud: UserDefaults = .standard
    
    static func set(_ key: ParameterKey, value: Bool) {
        ud.setValue(value, forKey: key.rawValue)
    }
    
    static func get (_ key: ParameterKey) -> Bool {
        return ud.bool(forKey: key.rawValue)
    }
    
}
