//
//  UserDetailView.swift
//  Zaap
//
//  Created by Christos Tzimas on 18/7/22.
//

import SwiftUI

struct UserDetailView: View {
    @Binding var userDetailText: String
    @Binding var isInputInvalid: Bool
    @State var showClearButton = false
    
    var placeholder = "Email"
    var prompt = ""
    var isSecure = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $userDetailText)
                        .onChange(of: userDetailText) { newText in
                            showClearButton = !newText.isEmpty
                        }
                } else {
                    TextField(placeholder, text: $userDetailText, onEditingChanged: { editing in
                        showClearButton = editing
                    }, onCommit: {
                        showClearButton = false
                    })
                }
                Spacer()
                ClearButton(text: $userDetailText, isVisible: $showClearButton)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            Text(isInputInvalid ? prompt : "")
                .padding([.leading, .bottom])
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

struct ClearButton: View {
    @Binding var text: String
    @Binding var isVisible: Bool
    
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(Color(.placeholderText))
            .opacity((!text.isEmpty && isVisible) ? 1 : 0)
            .onTapGesture { self.text = "" }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userDetailText: .constant(""), isInputInvalid: .constant(false))
    }
}
