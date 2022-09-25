//
//  ToastView.swift
//  Zaap
//
//  Created by Christos Tzimas on 25/9/22.
//

import SwiftUI

struct ToastView: View {
    var toastMessage: String
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
            Text(toastMessage)
        }
        .padding()
        .background(Color.orange.opacity(0.7))
        .cornerRadius(15)
        .foregroundColor(.white)
    }
}
