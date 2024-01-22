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
    var filteredProjects: [Project] {
        if searching.isEmpty {
            return viewModel.projects
        }
        
        return viewModel.projects.filter { project in
            project.title.clean().contains(searching.clean())
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredProjects) { project in
                NavigationLink(value: project) {
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
            .refreshable {
                await viewModel.fetchProjectsFromDatabase()
            }
            .alert("Error", isPresented: self.$viewModel.showErrorMessage) {
                
            } message: {
                Text(self.viewModel.errorMessage ?? "Unexpected error")
            }
            .onAppear {
                guard !viewModel.didFirstFetch else { return }
                Task {
                    await viewModel.fetchProjectsFromDatabase()
                }
            }
            .navigationDestination(for: Project.self) { project in
                ProjectDetailView(project: project)
            }
        }
    }
}

struct ProjectsList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsList(viewModel: ViewModel())
    }
}
