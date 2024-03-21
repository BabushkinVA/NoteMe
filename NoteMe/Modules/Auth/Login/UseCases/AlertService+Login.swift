//
//  AlertService+Login.swift
//  NoteMe
//
//  Created by Vadim on 27.02.24.
//

import Foundation

extension AlertService: LoginAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String) {
        showAlert(title: title, message: message, okTitle: okTitle, okHandler: nil)
    }
}
