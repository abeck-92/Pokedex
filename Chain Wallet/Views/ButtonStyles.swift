//
//  ButtonStyles.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/9/22.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .hidden()
            .padding(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 80))
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.yellow)
            )
            .overlay(configuration.label)
    }
}
