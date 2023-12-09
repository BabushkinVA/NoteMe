//
//  AuthService.swift
//  NoteMe
//
//  Created by Vadim on 6.12.23.
//

import Foundation
import FirebaseAuth

final class AuthService {
    
    private var firebase: Auth {
        return Auth.auth()
    }
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Bool) -> Void) {
        firebase.signIn(withEmail: email,
                        password: password) { result, error in
            completion(error == nil)
        }
    }
    
    func createUser(email: String,
                  password: String,
                  completion: @escaping (Bool) -> Void) {
        firebase.createUser(withEmail: email, password: password) { result, error in
            completion(error == nil)
        }
    }
    
    func resetPassw(email: String,
                 completion: @escaping (Bool) -> Void) {
        firebase.sendPasswordReset(withEmail: email) { error in
            completion(error == nil)
        }
    }
    
}

