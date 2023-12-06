//
//  AuthService+Login.swift
//  NoteMe
//
//  Created by Vadim on 6.12.23.
//

import Foundation

extension AuthService: LoginAuthServiceUseCase {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        self.signIn(email: email, password: password, completion: completion)
    }
}
