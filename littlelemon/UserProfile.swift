//
//  UserProfile.swift
//  littlelemon
//
//  Created by Rıdvan on 11.11.2023.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
       
    }
}

#Preview {
    UserProfile()
}
