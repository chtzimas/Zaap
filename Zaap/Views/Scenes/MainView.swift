//
//  MainView.swift
//  Zaap
//
//  Created by Christos Tzimas on 9/10/22.
//

import Factory
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HeaderView(title: "Hello, \(viewModel.getUsername())")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
