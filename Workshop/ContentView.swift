//
//  ContentView.swift
//  Workshop
//
//  Created by Profesor on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileNavigation(profile: Person.myProfile)
                .tag("profile")
                .tabItem {
                    Label("My Profile", systemImage: "person.circle")
                }
            MySocialMedia(socialMedia: SocialMedia.mySocialMedia)
                .tag("SocialMedia")
                .tabItem {
                    Label("Social Media", systemImage: "network")
                }
            ProjectsList(projects: Person.myProfile.projects)
                .tag("projects")
                .tabItem {
                    Label("Projects", systemImage: "folder")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
