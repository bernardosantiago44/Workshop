//
//  AuthenticationMainView.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 17/01/24.
//

import SwiftUI

struct AuthenticationMainView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    @StateObject var navigationModel: NavigationModel
    
    var body: some View {
        NavigationStack(path: self.$navigationModel.authenticationPath) {
            VStack {
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack {
                    NavigationLink {
                        AuthenticationView(navigationModel: self.navigationModel)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Create an account")
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                }
            }
        }
    }
}

#Preview {
    AuthenticationMainView(authViewModel: AuthenticationViewModel(), navigationModel: NavigationModel())
}
