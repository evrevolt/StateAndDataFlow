//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(setColor())
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(disableButton())
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            UserDefaults.standard.set(user.name, forKey: "username")
            user.isRegister.toggle()
        }
    }
    
    private func setColor() -> Color {
        name.count <= 3 || name.isEmpty ? Color.red : Color.green
    }
    
    private func disableButton() -> Bool {
        name.count <= 3 || name.isEmpty ? true : false
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
