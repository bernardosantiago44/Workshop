//
//  SocialMedia.swift
//  Workshop
//
//  Created by Profesor on 06/12/23.
//

import Foundation

struct SocialMedia: Identifiable {
    let id = UUID().uuidString
    var media: String
    var url: String
    var iconName: String
}

extension SocialMedia {
    static let mySocialMedia = [
        SocialMedia(media: "GitHub", url: "https://github.com/bernardosantiago44", iconName: "github"),
        SocialMedia(media: "Instagram", url: "https://www.instagram.com/bernardo.snn/", iconName: "instagram"),
        SocialMedia(media: "X", url: "https://twitter.com/@Bernardo510", iconName: "x")
    ]
}
