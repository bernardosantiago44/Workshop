//
//  AuthenticationManager.swift
//  Workshop
//
//  Created by Bernardo Santiago Marin on 13/01/24.
//

import Foundation
import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showErrorMessage = false
    @Published var errorMessage: String?
    @Published var actionResponse: ActionResponse? {
        didSet {
            if actionResponse == .successful { actionResponse = nil }
        }
    }
    
    /// This function validates an email and password and attempts to
    /// create a user in the database.
    ///
    func signUp(dismissView: @escaping () -> Void) {
        // validate email
        guard email.isValidEmail() else { return }
        guard password.count >= 6  else { return }
        self.actionResponse = .inProgress
        Task {
            do {
                let userData = try await AuthenticationManager.shared.createNewUser(email: self.email, password: self.password)
                try UserManager.shared.createUserDocument(from: userData)
                self.actionResponse = .successful
                dismissView()
            } catch {
                self.showErrorMessage = true
                self.errorMessage = error.localizedDescription
                self.actionResponse = .failed
                return
            }
        }
    }
    
    func logIn(dismissView: @escaping () -> Void) {
        // validate email
        guard email.isValidEmail() else { return }
        guard password.count >= 6  else { return }
        self.actionResponse = .inProgress
        
        Task {
            do {
                try await Auth.auth().signIn(withEmail: self.email, password: self.password)
                self.actionResponse = .successful
                dismissView()
            } catch {
                self.showErrorMessage = true
                self.errorMessage = error.localizedDescription
                self.actionResponse = .failed
                return
            }
        }
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() {}
    
    func createNewUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authUser = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authUser.user)
    }
    
    func signOut(dismissView: @escaping () -> Void) {
        do {
            try Auth.auth().signOut()
            dismissView()
        } catch {
            print(error.localizedDescription)
        }
    }
}

enum ActionResponse {
    case inProgress, successful, failed
}

struct AuthDataResultModel: Codable {
    var uid: String
    var email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
