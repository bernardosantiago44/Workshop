//
//  ProjectsList.swift
//  Workshop
//
//  Created by Profesor on 08/12/23.
//

import SwiftUI

struct ProjectsList: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searching = ""
    @State private var showNewProjectSheet = false
    let projects: [Project]
    var filteredProjects: [Project] {
        if searching.isEmpty {
            return projects
        }
        
        return projects.filter { project in
            project.title.clean().contains(searching.clean())
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredProjects) { project in
                NavigationLink {
                    ProjectDetailView(project: project)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(project.title)
                                .font(.title3)
                                .bold()
                            
                            Spacer()
                            
                            Text(project.rating, format: .number)
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        Text(project.description)
                            .lineLimit(3)
                    }
                }
            }
            .navigationTitle("Projects")
            .searchable(text: $searching)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.showNewProjectSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $showNewProjectSheet, content: {
                NavigationStack {
                    NewProjectSheet(viewModel: self.viewModel)
                }
            })
        }
    }
}

struct ProjectsList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsList(viewModel: ViewModel(), projects: Person.myProfile.projects)
    }
}
