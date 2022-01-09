//
//  AccountCreation.swift
//  Chain Wallet
//
//  Created by Austin Beck on 1/8/22.
//

import SwiftUI

struct AccountCreation: View {
    @State var name: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmation: String = ""
    
    var body: some View {
        VStack {
            Text("Create an Account")
            Spacer()
            FieldActionView(input: name, title: "Name", placeHolder: "Enter name...")
            FieldActionView(input: emailInput, title: "Email", placeHolder: "Enter email...")
            FieldActionView(input: passwordInput, title: "Password", placeHolder: "Enter password...")
            FieldActionView(input: passwordConfirmation, title: "Confirm Password", placeHolder: "Confirm password...")
            Spacer()
        }
    }
}

struct AccountCreation_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreation()
    }
}

struct FieldActionView: View {
    @State var input: String
    @State var title: String
    @State var placeHolder: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding([.trailing, .leading], 40)
            TextField(placeHolder, text: $input)
                .padding(2)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.gray)
                .padding([.trailing, .leading], 40)
            Divider()
                .frame(width: .infinity, height: 2)
                .padding([.trailing, .leading])
        }
    }
}
