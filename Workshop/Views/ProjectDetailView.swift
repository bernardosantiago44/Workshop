//
//  ProjectDetailView.swift
//  Workshop
//
//  Created by Profesor on 07/12/23.
//

import SwiftUI

struct ProjectDetailView: View {
    let project: Project
    var body: some View {
        List {
            Text(project.description)
            Text(project.rating, format: .number) +
            Text(" / 5 rating")
        }
        .navigationTitle(project.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectDetailView(project: Project.myProjects[0])
        }
    }
}
