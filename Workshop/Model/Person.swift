//
//  Person.swift
//  Workshop
//
//  Created by Profesor on 06/12/23.
//

import Foundation

struct Person {
    var nombre: String
    var profilePic: String
    var hobbies: [String]
    var projects: [Project]
    var socialMedia: [SocialMedia]
    var photos: [String]
}

extension Person {
    static let myProfile = Person(nombre: "Bernardo Santiago M",
                                  profilePic: "https://avatars.githubusercontent.com/u/63428964?v=4",
                                  hobbies: ["Coding", "Running", "Reading", "Teaching"],
                                  projects: Project.myProjects,
                                  socialMedia: SocialMedia.mySocialMedia,
                                  photos: [])
}
