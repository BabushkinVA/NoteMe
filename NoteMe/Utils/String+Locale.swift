//
//  String+Locale.swift
//  NoteMe
//
//  Created by Vadim on 6.11.23.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
