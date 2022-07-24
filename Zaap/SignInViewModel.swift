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
    @Published var signUpViewPresented = false
    
    enum OathSignInPlatform {
        case google
        case facebook
    }
    
    func signIn() {}

    func oathSignIn(with platform: OathSignInPlatform) {
        if isGoogle(platform) {
            
        } else {
            
        }
    }
    
    func isGoogle(_ platform: OathSignInPlatform) -> Bool {
        platform == .google
    }
    
    func signUp() {}
    func forgotPassword() {}
}
