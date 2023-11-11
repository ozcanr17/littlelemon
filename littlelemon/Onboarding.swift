//
//  Onboarding.swift
//  littlelemon
//
//  Created by Rıdvan on 9.11.2023.
//

import SwiftUI

let firstNameKey = "Rıdvan"
let lastNameKey = "Özcan"
let emailKey = "ridvan@ozcan.com"
let uIsLoggedIn = "uIsLoggedIn"

struct Onboarding: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
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
                        isLoggedIn = true
                        UserDefaults.standard.set(true, forKey: uIsLoggedIn)
                        UserDefaults.standard.set(firstName, forKey: firstNameKey)
                        UserDefaults.standard.set(lastName, forKey: lastNameKey)
                        UserDefaults.standard.set(email, forKey: emailKey)
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
            .onAppear() {
                if UserDefaults.standard.bool(forKey: uIsLoggedIn) {
                    isLoggedIn = true
                }            }
            .padding(.horizontal)
            .background(ignoresSafeAreaEdges: .all)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}

#Preview {
    Onboarding()
}
