//
//  NSAttributedString+HTML.swift
//  NoteMe
//
//  Created by Vadim on 24.02.24.
//

import UIKit

extension NSAttributedString {
    
    static func parse(html: String, font: UIFont) -> NSAttributedString? {
        let fontFamilyName = font.familyName
        let fontSize = font.pointSize
        
        if
            let data = "<span style=\"font-family: '-apple-system', '\(fontFamilyName)'; font-size: \(fontSize)\">\(html)</span>"
                .data(using: .unicode) {
            return try? NSAttributedString(data: data,
                                           options: [.documentType: NSAttributedString.DocumentType.html],
                                           documentAttributes: nil)
        }
        return nil
    }
    
}
