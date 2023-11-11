//
//  Home.swift
//  littlelemon
//
//  Created by Rıdvan on 10.11.2023.
//

import SwiftUI

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable {
    let name: String
    let price: Float
    let description: String
    let image: String
}

struct Home: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MenuView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Image("Logo")
                Spacer()
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Chicago")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            HStack{
                VStack(alignment: .leading) {
                    Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .frame(width: .infinity)
                }
                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .cornerRadius(20)
                Spacer()
            }
            Spacer()
        }
        .padding(.all)
    }
}


#Preview {
    Home()
}

