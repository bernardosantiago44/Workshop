//
//  ProjectDetailView.swift
//  Workshop
//
//  Created by Profesor on 07/12/23.
//

import SwiftUI

struct ProjectDetailView: View {
    let project: Project
    @State private var isEditing = false
    @Environment(\.editMode) var editMode
    
    var body: some View {
        if let editMode, editMode.wrappedValue.isEditing == true {
            ProjectEditView(project: self.project)
        } else {
            List {
                Text(project.description)
                Text(project.rating, format: .number) +
                Text(" / 5 rating")
            }
            .navigationTitle(project.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
            }
        }
    }
}

struct ProjectEditView: View {
    @State private var projectTitle: String
    init(project: Project) {
        self.projectTitle = project.title
    }
    
    var body: some View {
        Form {
            TextField("Project title", text: $projectTitle)
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectDetailView(project: Project.myProjects.first!)
                .environment(\.editMode, .constant(.active))
        }
    }
}
