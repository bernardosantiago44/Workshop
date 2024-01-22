//
//  SettingsView.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 17/01/24.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settingsViewModel: SettingsViewModel
    @ObservedObject var navigationModel: NavigationModel
    
    var body: some View {
        if let user = settingsViewModel.currentUser {
            NavigationStack {
                Form {
                    Section {
                        Text(user.email ?? "No provided email")
                        Button {
                            AuthenticationManager.shared.signOut {
                                self.navigationModel.showLoginView = true
                                self.navigationModel.goToMainTab()
                            }
                        } label: {
                            Label("Log out", systemImage: "arrow.uturn.backward")
                                .foregroundStyle(.red)
                        }
                    } header: {
                        Text("User")
                    }
                }
            .navigationTitle("Settings")
            }
        } else {
            Text("No current user logged in")
                .onAppear {
                    self.settingsViewModel.retrieveUser()
                }
        }
    }
}

#Preview {
    SettingsView(settingsViewModel: SettingsViewModel(), navigationModel: NavigationModel())    
}
