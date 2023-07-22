//
//  InputView.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 22.07.2023.
//

import SwiftUI

struct InputView: View {
    
    @Binding  var textValue: String
    @Binding var errorText: String
    let leftIcon: Image?
    let hint: String
    let textFieldTitle: String?
    
    init(textValue: Binding<String>, errorText: Binding<String>, leftIcon: Image? = nil, hint: String, textFieldTitle: String? = nil) {
        _textValue = textValue
        _errorText = errorText
        self.leftIcon = leftIcon
        self.hint = hint
        self.textFieldTitle = textFieldTitle
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if textFieldTitle != nil {
                Text(textFieldTitle!)
                    .font(
                        Font.custom("Inter", size: 18)
                            .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.52, green: 0.54, blue: 0.56))
            }
            HStack{
                leftIcon ?? leftIcon
                TextField(
                    hint,
                    text: $textValue
                )}
            .frame(height:60)
            .padding(.horizontal)
            .disableAutocorrection(true)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 1)
                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.98), lineWidth: 2)
            )
            if errorText.count > 1 {
                Text("hata mesaji")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical,5)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(textValue: .constant("erdal"), errorText: .constant("erdal"), hint:"hint")
    }
}
