//
//  AuthService+Register.swift
//  NoteMe
//
//  Created by Vadim on 26.02.24.
//

import Foundation

extension AuthService: RegisterAuthServiceUseCase{
    func register(email: String, 
                  password: String,
                  repeatPassword: String,
                  completion: @escaping (Bool) -> Void) {
        self.createUser(email: email,
                        password: password,
                        completion: completion)
        
    }
}
