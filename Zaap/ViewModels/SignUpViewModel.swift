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
    @Published var signUpCompleted = false
    
    public var user: User?
    
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
    
    private var userService: UserService
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
            user = try await userService.createUser(User(email: email, username: username, password: password))
            state = .userCreated
            let mainViewModel = DependencyInjector.shared.resolve(type: MainViewModel.self)!
            mainViewModel.user = user
            await MainActor.run { signUpCompleted = true }
        } catch {
            state = .userCreationFailed
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
