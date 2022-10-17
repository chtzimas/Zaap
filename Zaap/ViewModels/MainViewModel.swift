//
//  MainViewModel.swift
//  Zaap
//
//  Created by Christos Tzimas on 9/10/22.
//

import SwiftUI

class MainViewModel: ObservableObject {
    var user: User?
    
    func getUsername() -> String {
        user?.username ?? ""
    }
}
