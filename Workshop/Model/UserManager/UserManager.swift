//
//  UserManager.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 14/01/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserManager {
    static let shared = UserManager()
    private init() { }
    
    func createUserDocument(from user: AuthDataResultModel) throws {
        try Firestore.firestore().collection("users").document(user.uid).setData(from: user)
    }
    
    func getCurrentUser() throws -> AuthDataResultModel {
        if let user = Auth.auth().currentUser {
            return AuthDataResultModel(user: user)
        }
        throw AuthErrorCode(.userNotFound)
    }
}
