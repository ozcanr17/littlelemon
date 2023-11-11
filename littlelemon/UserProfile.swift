//
//  UserProfile.swift
//  littlelemon
//
//  Created by Rıdvan on 11.11.2023.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: firstNameKey) ?? ""
    let lastName = UserDefaults.standard.string(forKey: lastNameKey) ?? ""
    let email = UserDefaults.standard.string(forKey: emailKey) ?? ""
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    Text("Personal Information")
                        .font(.title3)
                        .fontWeight(.bold)
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .offset(x: -50)
                }
                Spacer()
            }
            .padding()
            LabeledContent("First Name: ", value: firstName)
                .frame(height: 40)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
            LabeledContent("Last Name", value: lastName)
                .frame(height: 40)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
            LabeledContent("Email", value: email)
                .frame(height: 40)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
            .background(Color.white)
            Spacer()
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: uIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .foregroundColor(.black)
            .font(.title3)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.yellow)
            )
            .padding(.horizontal)
            .padding()
        }
    }
    
}

#Preview {
    UserProfile()
}
