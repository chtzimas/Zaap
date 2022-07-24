//
//  SignInView.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = DependencyInjector.shared.resolve(type: SignInViewModel.self)!
    
    var body: some View {
        VStack {
            welcomeView
            UserDetailView(userDetailText: $viewModel.email, placeholder: L10n.emailPlaceholder)
            UserDetailView(userDetailText: $viewModel.password, placeholder: L10n.passwordPlaceholder)
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
            signUpButtonView
                .padding(.top, 40)
        }
        .padding(.horizontal, 30)
    }
    
    private var welcomeView: some View {
        Text(L10n.welcomeHeader)
            .padding()
            .font(.headline)
    }
    
    private var signInButtonView: some View {
        Button(action: viewModel.signIn) {
            Text(L10n.signIn)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .frame(maxWidth: .infinity)
    }
    
    private var forgotPasswordButtonView: some View {
        Button(action: viewModel.forgotPassword) {
            Text(L10n.forgotPassword)
                .fontWeight(.bold)
                .tint(.orange)
        }
    }
    
    private var signUpButtonView: some View {
        HStack {
            Text(L10n.donTHaveAnAccount)
                .foregroundColor(.gray)
            Button(action: viewModel.signUp) {
                Text(L10n.signUp)
                    .fontWeight(.bold)
                    .tint(.orange)
            }
        }
    }
    
    private func oathSignInButtonView(with platform: SignInViewModel.OathSignInPlatform) -> some View {
        Button(action: {
            viewModel.oathSignIn(with: platform)
        }, label: {
            if viewModel.isGoogle(platform) {
                Image(Asset.googleLogo.name)
            } else {
                Image(Asset.facebookLogo.name)
            }
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: DependencyInjector.shared.resolve(type: SignInViewModel.self)!)
    }
}
