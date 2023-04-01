//
//  MainViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 9/10/22.
//

import Factory
import SwiftUI

class MainViewModel: ObservableObject {
    @Injected(\.userService) private var userService
    
    func getUsername() -> String {
        userService.user?.username ?? ""
    }
}
