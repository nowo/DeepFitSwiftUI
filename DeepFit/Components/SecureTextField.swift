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
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 1)
                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.98), lineWidth: 2)
            )
    }
}

struct SecureTextField: View {
    @State private var showPassword = false
    let hint: String
    let label: String
    @Binding var text: String

    var body: some View {
            
        VStack(alignment: .leading){
            Text(label)
                .font(
                    Font.custom("Inter", size: 18)
                        .weight(.medium)
                )
                .foregroundColor(Color(red: 0.52, green: 0.54, blue: 0.56))
            
            if showPassword {
                TextField(hint, text: $text)
                    .textFieldStyle(SecureTextFieldStyle(showPassword: $showPassword))
                    
            } else {
                SecureField(hint, text: $text)
                    .textFieldStyle(SecureTextFieldStyle(showPassword: $showPassword))
            }
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
