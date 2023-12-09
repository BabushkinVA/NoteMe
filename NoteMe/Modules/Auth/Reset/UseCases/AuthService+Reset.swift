//
//  AuthService+Reset.swift
//  NoteMe
//
//  Created by Vadim on 9.12.23.
//

import Foundation

extension AuthService: ResetAuthServiceUseCase {
    func resetPassword(email: String, completion: @escaping (Bool) -> Void) {
        self.resetPassw(email: email, completion: completion)
    }
}
