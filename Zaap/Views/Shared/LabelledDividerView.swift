//
//  LabelledDividerView.swift
//  Zaap
//
//  Created by Christos Tzimas on 24/7/22.
//

import SwiftUI

struct LabelledDividerView: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, horizontalPadding: CGFloat = 6, color: Color = .white) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    
    var body: some View {
        HStack {
            line
            Text(label)
                .foregroundColor(color)
            line
        }
    }
    
    var line: some View {
        VStack { Divider().background(color) }
            .padding(horizontalPadding)
    }
}
