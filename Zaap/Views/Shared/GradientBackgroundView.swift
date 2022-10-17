//
//  GradientBackgroundView.swift
//  Zaap
//
//  Created by Christos Tzimas on 25/9/22.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [
                            Color(Asset.Colors.backgroundColor.color),
                            Color(Asset.Colors.backgroundColor.color),
                            Color(.gray)
                        ]),
                       startPoint: .bottom, endPoint: .topTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundVIew_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView()
    }
}

