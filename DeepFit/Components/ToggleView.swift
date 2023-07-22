//
//  ToggleView.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 20.07.2023.
//

import SwiftUI



struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.red)

                configuration.label
            }
        })
    }
}

