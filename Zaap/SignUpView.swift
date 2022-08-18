//
//  SignUpView.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = DependencyInjector.shared.resolve(type: SignUpViewModel.self)!
    
    var body: some View {
        VStack {
            headerView
            UserDetailView(userDetailText: $viewModel.email, isInputInvalid: $viewModel.showEmailPrompt, placeholder: L10n.emailPlaceholder, prompt: L10n.signUpEmailPrompt)
            UserDetailView(userDetailText: $viewModel.username, isInputInvalid: $viewModel.showUsernamePrompt, placeholder: L10n.usernamePlaceholder, prompt: L10n.usernamePrompt)
            UserDetailView(userDetailText: $viewModel.password, isInputInvalid: $viewModel.showPasswordPrompt ,placeholder: L10n.passwordPlaceholder, prompt: L10n.signUpPasswordPrompt, isSecure: true)
            UserDetailView(userDetailText: $viewModel.verifiedPassword, isInputInvalid: $viewModel.showVerifiedPasswordPrompt, placeholder: L10n.verifiedPasswordPlaceholder, prompt: L10n.verifiedPasswordPrompt, isSecure: true)
            signUpButtonView
                .padding(.vertical, 20)
        }
        .padding(.horizontal, 30)
    }
    
    private var headerView: some View {
        Text(L10n.signUp)
            .padding()
            .font(.headline)
    }
    
    private var signUpButtonView: some View {
        Button(action: { viewModel.userAbleToSignUp ? viewModel.signUp() : viewModel.showInvalidInputPrompt() }) {
            Text(L10n.signUp)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .frame(maxWidth: .infinity)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: DependencyInjector.shared.resolve(type: SignUpViewModel.self)!)
    }
}
