//
//  PersonProfilePicture.swift
//  Workshop
//
//  Created by Profesor on 06/12/23.
//

import SwiftUI

struct PersonProfilePicture: View {
    let profilePictureUrl: String
    let name: String
    var pictureUrl: URL? {
        URL(string: profilePictureUrl)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: pictureUrl) { image in
                image.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(Circle())
                    .overlay(Material.bar, in:
                                Circle()
                        .stroke(lineWidth: 5)
                    )
            }
            Text(name)
                .font(.title3)
                .padding(6)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct PersonProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        PersonProfilePicture(profilePictureUrl: Person.myProfile.profilePic, name: Person.myProfile.nombre)
    }
}
