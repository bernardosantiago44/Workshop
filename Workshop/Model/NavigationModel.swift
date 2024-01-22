//
//  NavigationModel.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 17/01/24.
//

import SwiftUI
import FirebaseAuth

final class NavigationModel: ObservableObject {
    @Published var selectedTab: NavigationTab
    @Published var showLoginView: Bool
    @Published var authenticationPath: NavigationPath
    
    init() {
        self.selectedTab = .profile
        self.authenticationPath = NavigationPath()
        self.showLoginView = Auth.auth().currentUser == nil
    }
    
    func goToMainTab() {
        self.selectedTab = .profile
    }
}

enum NavigationTab: String {
    case profile = "person.circle"
    case socialMedia = "network"
    case projects = "folder"
    case settings = "gear"
}
