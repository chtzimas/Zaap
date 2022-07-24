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
            UserDetailView(userDetailText: $viewModel.email, placeholder: L10n.emailPlaceholder)
            UserDetailView(userDetailText: $viewModel.username, placeholder: L10n.usernamePlaceholder)
            UserDetailView(userDetailText: $viewModel.password, placeholder: L10n.passwordPlaceholder)
            UserDetailView(userDetailText: $viewModel.verifiedPassword, placeholder: L10n.verifyPasswordPlaceholder)
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
        Button(action: viewModel.signUp) {
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
