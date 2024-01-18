//
//  ViewModel.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 12/01/24.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var projects: [Project] = Project.myProjects
}
