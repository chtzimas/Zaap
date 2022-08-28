//
//  SignInViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var userAbleToSignIn = false
    @Published var showEmailPrompt = false
    @Published var showPasswordPrompt = false
    
    enum OathSignInPlatform {
        case google
        case facebook
    }
    
    private var userDetailsAreNotEmpty: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    func signIn() {}
    
    func showInvalidInputPrompt() {
        showEmailPrompt = email.isEmpty
        showPasswordPrompt = password.isEmpty
    }

    func oathSignIn(with platform: OathSignInPlatform) {
        if isGoogle(platform) {
            
        } else {
            
        }
    }
    
    func isGoogle(_ platform: OathSignInPlatform) -> Bool {
        platform == .google
    }
    
    func clearUserDetails() {
        email = ""
        password = ""
        showEmailPrompt = false
        showPasswordPrompt = false
    }

    func forgotPassword() {}
}
