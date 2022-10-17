//
//  SignUpView.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import SimpleToast
import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = DependencyInjector.shared.resolve(type: SignUpViewModel.self)!
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                HeaderView(title: L10n.signUp)
                UserDetailView(userDetailText: $viewModel.email,
                               isInputInvalid: $viewModel.showEmailPrompt,
                               placeholder: L10n.emailPlaceholder,
                               prompt: L10n.signUpEmailPrompt
                )
                UserDetailView(userDetailText: $viewModel.username,
                               isInputInvalid: $viewModel.showUsernamePrompt,
                               placeholder: L10n.usernamePlaceholder,
                               prompt: L10n.usernamePrompt
                )
                UserDetailView(userDetailText: $viewModel.password,
                               isInputInvalid: $viewModel.showPasswordPrompt,
                               placeholder: L10n.passwordPlaceholder,
                               prompt: L10n.signUpPasswordPrompt,
                               isSecure: true
                )
                UserDetailView(userDetailText: $viewModel.verifiedPassword,
                               isInputInvalid: $viewModel.showVerifiedPasswordPrompt,
                               placeholder: L10n.verifiedPasswordPlaceholder,
                               prompt: L10n.verifiedPasswordPrompt,
                               isSecure: true
                )
                NavigationLink(destination: MainView(), isActive: $viewModel.signUpCompleted) {
                    EmptyView()
                }
                signUpButtonView
                    .padding(.vertical, 20)
            }
            .padding(.horizontal, 30)
            .onDisappear {
                viewModel.clearUserDetailsInput()
                viewModel.clearUserDetailsPrompt()
            }
            .simpleToast(isPresented: $viewModel.showToast, options: viewModel.toastOptions) {
                ToastView(toastMessage: viewModel.toastMessage)
            }
        }
    }
    
    private var signUpButtonView: some View {
        VStack {
            NavigationLink(destination: MainView(), isActive: $viewModel.signUpCompleted) {
                EmptyView()
            }
            Button(L10n.signUp) {
                if viewModel.userDetailsMeetCriteria {
                    viewModel.clearUserDetailsPrompt()
                    Task {
                        await viewModel.signUp()
                    }
                } else {
                    viewModel.showInvalidInputPrompt()
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
        }
        .frame(maxWidth: .infinity)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: DependencyInjector.shared.resolve(type: SignUpViewModel.self)!)
    }
}
