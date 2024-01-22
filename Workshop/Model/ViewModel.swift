//
//  ViewModel.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 12/01/24.
//

import Foundation
import FirebaseFirestore

@MainActor
final class ViewModel: ObservableObject {
    @Published var projects = [Project]()
    @Published var showErrorMessage = false
    @Published var errorMessage: String?
    @Published var actionResponse: ActionResponse? {
        didSet {
            if actionResponse == .successful { actionResponse = nil }
        }
    }
    var didFirstFetch = false
    let database = Firestore.firestore()
    
    func addNewProject(project: Project, dismissView: @escaping () -> Void) {
        self.actionResponse = .inProgress
        do {
            let currentUser = try UserManager.shared.getCurrentUser()
            try database.collection("users").document(currentUser.uid).collection("projects").document(project.id).setData(from: project)
            self.projects.append(project)
            self.actionResponse = .successful
            dismissView()
        } catch {
            self.showErrorMessage = true
            self.errorMessage = error.localizedDescription
            self.actionResponse = .failed
            return
        }
    }
    
    func fetchProjectsFromDatabase() async {
        do {
            let currentUser = try UserManager.shared.getCurrentUser()
            let snapshot = try await database.collection("users").document(currentUser.uid).collection("projects").getDocuments()
            self.projects.removeAll()
            for document in snapshot.documents {
                try self.projects.append(document.data(as: Project.self))
            }
        } catch {
            self.showErrorMessage = true
            self.errorMessage = error.localizedDescription
            self.actionResponse = .failed
            return
        }
        self.actionResponse = .successful
    }
}
