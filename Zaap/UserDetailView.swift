//
//  UserDetailView.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import SwiftUI

struct UserDetailView: View {
    @Binding var userDetailText: String
    @State var showClearButton = false
    
    var placeholder = "Email"
    
    var body: some View {
        TextField(placeholder, text: $userDetailText, onEditingChanged: { editing in
            self.showClearButton = editing
        }, onCommit: {
            self.showClearButton = false
        })
            .modifier(ClearButton(text: $userDetailText, isVisible: $showClearButton))
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    @Binding var isVisible: Bool

    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(Color(.placeholderText))
                .opacity((!text.isEmpty && isVisible) ? 1 : 0)
                .onTapGesture { self.text = "" }
        }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userDetailText: .constant(""))
    }
}
