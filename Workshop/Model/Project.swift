//
//  Project.swift
//  Workshop
//
//  Created by Profesor on 06/12/23.
//

import Foundation

struct Project: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var rating: Float
    var photos: [String]
}

extension Project {
    static let myProjects = [
        Project(title: "SwiftUI Course",
                description: "Learned app development with 15 other people in Swift using SwiftUI",
                rating: 5,
                photos: []),
        Project(title: "App development",
                description: "Learned app development with 15 other people in Swift using SwiftUI",
                rating: 5,
                photos: []),
        Project(title: "Course at Tec",
                description: "Learned app development with 15 other people in Swift using SwiftUI",
                rating: 5,
                photos: [])
    ]
}
