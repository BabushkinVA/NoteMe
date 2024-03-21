//
//  UIDatePicker+Styles.swift
//  NoteMe
//
//  Created by Vadim on 11.03.24.
//

import UIKit

extension UIDatePicker {
    
    static func datePickerStyle(mode: UIDatePicker.Mode,
                                _ selector: Selector) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = mode
        datePicker.addTarget(self,
                             action: selector,
                             for: .valueChanged)
        return datePicker
    }
    
}

