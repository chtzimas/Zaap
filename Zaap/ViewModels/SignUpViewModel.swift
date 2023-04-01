//
//  SignUpViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import Factory
import SimpleToast
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Injected(\.userService) private var userService
    
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var verifiedPassword = ""
    @Published var showEmailPrompt = false
    @Published var showUsernamePrompt = false
    @Published var showPasswordPrompt = false
    @Published var showVerifiedPasswordPrompt = false
    @Published var showToast = false
    @Published var signUpCompleted = false
    
    private enum UserDetailCriteria {
        // valid: Chars, a '@', chars, a '.' and at least one char. e.g: takhs@takaros.c
        static let emailRegex = try! NSRegularExpression(pattern: #"^\S+@\S+\.\S+$"#)
        // valid: Minimum 8 chars - at least 1 lowercase, 1 uppercase, 1 number and 1 special char. e.g: a1^kklmR
        static let passwordRegex = try! NSRegularExpression(pattern: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
    }
    
    enum State {
        case creatingUser
        case userCreated
        case userCreationFailed
        case none
    }
    
    private(set) var state: State = .none
    private(set) var toastMessage = ""
    private(set) var toastOptions = SimpleToastOptions(alignment: .bottom, hideAfter: 3)
    
    func userDetailsMeetCriteria() -> Bool {
        emailMeetsCriteria() && usernameMeetsCriteria() && passwordMeetsCriteria() && verifiedPasswordMeetsCriteria()
    }
    
    func emailMeetsCriteria() -> Bool {
        UserDetailCriteria.emailRegex.matches(email)
    }
    
    func usernameMeetsCriteria() -> Bool {
        !username.isEmpty
    }
    
    func passwordMeetsCriteria() -> Bool {
        UserDetailCriteria.passwordRegex.matches(password)
    }
    
    func verifiedPasswordMeetsCriteria() -> Bool {
        verifiedPassword == password
    }
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func signUp() async {
        do {
            state = .creatingUser
            print("\(self): \(state)")
            let request = SignUpRequest(user: User(email: email, username: username, password: password))
            try await userService.signUp(with: request)
            state = .userCreated
            print("\(self): \(state)")
            await MainActor.run { signUpCompleted = true }
        } catch {
            state = .userCreationFailed
            print("\(self): \(state)")
            if let error = error as? ApiErrorProtocol, let message = error.errorDescription {
                toastMessage = message 
                await MainActor.run { showToast = true }
            }
        }
    }
    
    func showInvalidInputPrompt() {
        showEmailPrompt = !emailMeetsCriteria()
        showUsernamePrompt = !usernameMeetsCriteria()
        showPasswordPrompt = !passwordMeetsCriteria()
        showVerifiedPasswordPrompt = !verifiedPasswordMeetsCriteria()
    }
    
    func clearUserDetailsInput() {
        email = ""
        username = ""
        password = ""
        verifiedPassword = ""
    }
    
    func clearUserDetailsPrompt() {
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
