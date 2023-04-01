//
//  SignInView.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import Factory
import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                GradientBackgroundView()
                VStack {
                    HeaderView(title: L10n.welcomeHeader)
                    UserDetailView(userDetailText: $viewModel.email,
                                   isInputInvalid: $viewModel.showEmailPrompt,
                                   placeholder: L10n.emailPlaceholder,
                                   prompt: L10n.signInEmailPrompt
                    )
                    UserDetailView(userDetailText: $viewModel.password,
                                   isInputInvalid: $viewModel.showPasswordPrompt,
                                   placeholder: L10n.passwordPlaceholder,
                                   prompt: L10n.signInPasswordPrompt,
                                   isSecure: true
                    )
                    signInButtonView
                        .padding(.vertical, 20)
                    forgotPasswordButtonView
                    LabelledDividerView(label: L10n.or)
                        .padding(.top, 30)
                    HStack {
                        oathSignInButtonView(with: .google)
                            .padding(.trailing, 20)
                        oathSignInButtonView(with: .facebook)
                            .padding(.leading, 20)
                    }
                    .padding(.top, 20)
                    HStack {
                        dontHaveAnAccountView
                        signUpButtonView
                    }
                    .padding(.top, 40)
                }
                .padding(.horizontal, 30)
            }
        }
    }
    
    private var signInButtonView: some View {
        Button(action: { viewModel.userAbleToSignIn ? viewModel.signIn() : viewModel.showInvalidInputPrompt() }) {
            Text(L10n.signIn)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
        .frame(maxWidth: .infinity)
    }
    
    private var forgotPasswordButtonView: some View {
        Button(action: viewModel.forgotPassword) {
            Text(L10n.forgotPassword)
                .fontWeight(.bold)
                .tint(.white)
        }
    }
    
    private var dontHaveAnAccountView: some View {
        Text(L10n.donTHaveAnAccount)
            .foregroundColor(.white)
    }
    
    private var signUpButtonView: some View {
        NavigationLink(destination: SignUpView()) {
            Text(L10n.signUp)
                .fontWeight(.bold)
                .tint(.white)
        }
        .simultaneousGesture(TapGesture().onEnded {
            viewModel.clearUserDetails()
        })
    }
    
    private func oathSignInButtonView(with platform: SignInViewModel.OathSignInPlatform) -> some View {
        Button(action: {
            viewModel.oathSignIn(with: platform)
        }, label: {
            if viewModel.isGoogle(platform) {
                Image(Asset.Images.googleLogo.name)
            } else {
                Image(Asset.Images.facebookLogo.name)
            }
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
