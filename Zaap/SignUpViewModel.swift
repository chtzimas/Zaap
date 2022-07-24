//
//  SignUpViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var verifiedPassword = ""
    
    func signUp() {}
    func cancel() {}
}
