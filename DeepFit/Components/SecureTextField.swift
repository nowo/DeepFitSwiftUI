//
//  SecureTextField.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 22.07.2023.
//

import SwiftUI

struct SecureTextFieldStyle: TextFieldStyle {
    @Binding var showPassword: Bool

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .modifier(TextFieldShowHideButton(showPassword: $showPassword))
            .multilineTextAlignment(.leading)
            .padding()
            .autocapitalization(.none)
            .background(RoundedRectangle(cornerRadius: 10)
                .inset(by: 1) // Preventing clipping of the border
                .stroke(.gray, lineWidth: 1))
    }
}

struct SecureTextField: View {
    @State private var showPassword = false

    let label: String
    @Binding var text: String

    var body: some View {
        if showPassword {
            TextField(label, text: $text)
                .textFieldStyle(SecureTextFieldStyle(showPassword: $showPassword))
        } else {
            SecureField(label, text: $text)
                .textFieldStyle(SecureTextFieldStyle(showPassword: $showPassword))
        }
    }
}

struct TextFieldShowHideButton: ViewModifier {
    @Binding var showPassword: Bool

    func body(content: Content) -> some View {
        HStack {
            content
            Button(action: {
                showPassword.toggle()
            }, label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.accentColor)
            })
        }
    }
}
