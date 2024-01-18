//
//  NewProjectSheet.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 12/01/24.
//

import SwiftUI

struct NewProjectSheet: View {
    @ObservedObject var viewModel: ViewModel
    @State private var projectTitle = ""
    @State private var projectDescription = ""
    @State private var projectRating: Float = 0
    @Environment(\.dismiss) var dismiss
    var isInvalidProject: Bool {
        return projectTitle.clean().isEmpty || projectDescription.count < 10 || projectRating < 0 || projectRating > 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("project name", text: $projectTitle)
                TextEditor(text: $projectDescription)
                    .frame(minHeight: 100)
            } header: {
                Text("Name and description")
            }
            Section {
                Slider(value: $projectRating, in: 0...5, step: 1)
                Text("Rating: \(projectRating, format: .number)/5")
            }
        }
        .navigationTitle(projectTitle.clean().isEmpty ? "New project" : projectTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Add") {
                    
                }
                .disabled(self.isInvalidProject)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                .tint(.red)

            }
        }
    }
}

struct NewProjectSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewProjectSheet(viewModel: ViewModel())
        }
    }
}
