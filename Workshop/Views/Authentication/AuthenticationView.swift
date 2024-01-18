//
//  RegisterView.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 14/01/24.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var authViewModel = AuthenticationViewModel()
    @StateObject var navigationModel: NavigationModel
    var disableButtons: Bool {
        return !authViewModel.email.isValidEmail() || authViewModel.password.count < 6 || authViewModel.actionResponse == .inProgress
    }
    
    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            TextField("Email", text: $authViewModel.email)
                .textInputAutocapitalization(.never)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            SecureField("Password", text: $authViewModel.password)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15))
            HStack {
                createAccountButton
                logInButton
            }
            
        }
        .padding(.horizontal)
        .alert("Error", isPresented: self.$authViewModel.showErrorMessage) {
            
        } message: {
            Text(self.authViewModel.errorMessage ?? "An unknown error occured.")
        }

    }
    
    var createAccountButton: some View {
        Button {
            self.authViewModel.signUp {
                self.navigationModel.showLoginView = false
            }
        } label: {
            if authViewModel.actionResponse != .inProgress {
                Text("Create account")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            } else {
                ProgressView()
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .buttonStyle(.bordered)
        .disabled(disableButtons)
    }
    var logInButton: some View {
        Button {
            self.authViewModel.logIn {
                self.navigationModel.showLoginView = false
            }
        } label: {
            if authViewModel.actionResponse != .inProgress {
                Text("Log in")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            } else {
                ProgressView()
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .buttonStyle(.borderedProminent)
        .disabled(disableButtons)
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(navigationModel: NavigationModel())
    }
}
