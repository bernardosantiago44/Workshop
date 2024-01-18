//
//  ContentView.swift
//  Workshop
//
//  Created by Profesor on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var navigationModel: NavigationModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        TabView(selection: self.$navigationModel.selectedTab) {
            ProfileNavigation(viewModel: self.viewModel, profile: Person.myProfile)
                .tag(NavigationTab.profile)
                .tabItem {
                    Label("My Profile", systemImage: NavigationTab.profile.rawValue)
                }
            MySocialMedia(socialMedia: SocialMedia.mySocialMedia)
                .tag(NavigationTab.socialMedia)
                .tabItem {
                    Label("Social Media", systemImage: NavigationTab.socialMedia.rawValue)
                }
            ProjectsList(viewModel: ViewModel(), projects: Person.myProfile.projects)
                .tag(NavigationTab.projects)
                .tabItem {
                    Label("Projects", systemImage: NavigationTab.projects.rawValue)
                }
            SettingsView(settingsViewModel: self.settingsViewModel, navigationModel: self.navigationModel)
                .tag(NavigationTab.settings)
                .tabItem { Label("Settings", systemImage: NavigationTab.settings.rawValue) }
        }
        .fullScreenCover(isPresented: self.$navigationModel.showLoginView, content: {
            AuthenticationView(navigationModel: self.navigationModel)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(), navigationModel: NavigationModel(), settingsViewModel: SettingsViewModel())
    }
}
