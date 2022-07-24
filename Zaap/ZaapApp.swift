//
//  ZaapApp.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import SwiftUI

@main
struct ZaapApp: App {
    let container = DependencyInjector.shared
    
    init() {
        container.register(type: SignInViewModel.self, component: SignInViewModel())
        container.register(type: SignUpViewModel.self, component: SignUpViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
