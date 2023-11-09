//
//  Onboarding.swift
//  littlelemon
//
//  Created by Rıdvan on 9.11.2023.
//

import SwiftUI

let uniqueFirstName = "Rıdvan"
let uniqueLastName = "Özcan"
let uniqueEmail = "ridvan@ozcan.com"

struct Onboarding: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Welcome to Little Lemon")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(30)
            TextField("First Name", text: $firstName)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            TextField("Last Name", text: $lastName)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            Button("Register") {
                if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: uniqueFirstName)
                        UserDefaults.standard.set(lastName, forKey: uniqueLastName)
                        UserDefaults.standard.set(email, forKey: uniqueEmail)
                    } else {
                        if email.isEmpty || !isValidEmail(email) {
                        showAlert = true
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
            .background(Color.black)
            .cornerRadius(10)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invaild Email"),
                    message: Text("Please provide a valid e-mail address.")
                )
            }
        }
        .padding(.horizontal)
        .background(ignoresSafeAreaEdges: .all)
    }
    func isValidEmail(_ email: String) -> Bool {
      let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
      let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
      return emailValidationPredicate.evaluate(with: email)
    }}

#Preview {
    Onboarding()
}
