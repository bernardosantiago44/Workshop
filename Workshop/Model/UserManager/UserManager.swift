//
//  UserManager.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 14/01/24.
//

import Foundation
import FirebaseFirestore

class UserManager {
    static let shared = UserManager()
    private init() { }
    
    func createUserDocument(from user: AuthDataResultModel) throws {
        try Firestore.firestore().collection("users").document(user.uid).setData(from: user)
    }
}
