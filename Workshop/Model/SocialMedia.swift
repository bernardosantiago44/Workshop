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
}

extension SocialMedia {
    static let mySocialMedia = [
        SocialMedia(media: "GitHub", url: "https://github.com/bernardosantiago44")
    ]
}
