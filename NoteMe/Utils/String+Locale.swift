//
//  String+Locale.swift
//  NoteMe
//
//  Created by Vadim on 16.02.24.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
