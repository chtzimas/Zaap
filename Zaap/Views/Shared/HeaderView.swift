//
//  HeaderView.swift
//  Zaap
//
//  Created by Christos Tzimas on 9/10/22.
//

import SwiftUI

struct HeaderView: View {
    private var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .padding()
            .font(.headline)
            .foregroundColor(.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Welcome to Zaap")
    }
}
