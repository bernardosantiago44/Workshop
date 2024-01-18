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
    
    func retrieveUser() {
        self.currentUser = Auth.auth().currentUser
    }
}
