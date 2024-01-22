//
//  SettingsViewModel.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 17/01/24.
//

import Foundation
import FirebaseAuth

final class SettingsViewModel: ObservableObject {
    @Published var currentUser: User? 
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        registerAuthStateHandler()
    }
    
    func retrieveUser() {
        self.currentUser = Auth.auth().currentUser
    }
    
    func registerAuthStateHandler() {
        if self.authStateHandler == nil {
            self.authStateHandler = Auth.auth().addStateDidChangeListener({ auth, user in
                self.currentUser = user
            })
        }
    }
}
