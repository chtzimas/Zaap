//
//  SignUpViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import SimpleToast
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var verifiedPassword = ""
    @Published var showEmailPrompt = false
    @Published var showUsernamePrompt = false
    @Published var showPasswordPrompt = false
    @Published var showVerifiedPasswordPrompt = false
    @Published var showToast = false
    
    enum UserDetailCriteria {
        // valid: Chars, a '@', chars, a '.' and at least one char. e.g: takhs@takaros.c
        static let emailRegex = try! NSRegularExpression(pattern: #"^\S+@\S+\.\S+$"#)
        // valid: Minimum 8 chars - at least 1 lowercase, 1 uppercase, 1 number and 1 special char. e.g: a1^kklmR
        static let passwordRegex = try! NSRegularExpression(pattern: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
    }
    
    private var apiService: ApiService
    private(set) var toastMessage = ""
    private(set) var toastOptions = SimpleToastOptions(alignment: .bottom, hideAfter: 5)
    
    var userDetailsMeetCriteria: Bool {
        emailMeetsCriteria && usernameMeetsCriteria && passwordMeetsCriteria && verifiedPasswordMeetsCriteria
    }
    
    private var emailMeetsCriteria: Bool {
        UserDetailCriteria.emailRegex.matches(email)
    }
    
    private var usernameMeetsCriteria: Bool {
        !username.isEmpty
    }
    
    private var passwordMeetsCriteria: Bool {
        UserDetailCriteria.passwordRegex.matches(password)
    }
    
    private var verifiedPasswordMeetsCriteria: Bool {
        UserDetailCriteria.passwordRegex.matches(verifiedPassword) && verifiedPassword == password
    }
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    func signUp() async throws {
        let user = try await apiService.createUser(with: ["email": email, "username": username, "password": password])
        print("user: \(user)")
    }
    
    func showInvalidInputPrompt() {
        showEmailPrompt = !emailMeetsCriteria
        showUsernamePrompt = !usernameMeetsCriteria
        showPasswordPrompt = !passwordMeetsCriteria
        showVerifiedPasswordPrompt = !verifiedPasswordMeetsCriteria
    }
    
    func clearUserDetails() {
        email = ""
        username = ""
        password = ""
        verifiedPassword = ""
        showEmailPrompt = false
        showUsernamePrompt = false
        showPasswordPrompt = false
        showVerifiedPasswordPrompt = false
    }
}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
