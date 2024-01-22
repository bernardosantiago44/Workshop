//
//  Project.swift
//  Workshop
//
//  Created by Profesor on 06/12/23.
//

import Foundation

struct Project: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var rating: Float
    var photos: [String]
    
    init() {
        self.title = ""
        self.description = ""
        self.rating = 1
        self.photos = []
    }
    
    init(title: String, description: String, rating: Float, photos: [String]) {
        self.title = title
        self.description = description
        self.rating = rating
        self.photos = photos
    }
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
