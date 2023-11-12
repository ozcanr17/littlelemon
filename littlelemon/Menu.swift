//
//  Menu.swift
//  littlelemon
//
//  Created by Rıdvan on 12.11.2023.
//

import SwiftUI

struct Menu: View {
    
    func getMenuData() {
        let menuURL: URL = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let reqURL = URLRequest(url: menuURL)
        let task = URLSession.shared.dataTask(with: reqURL) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                print("Received data: \(data)")
            }
            
        }
        task.resume()
        
    }
    
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
        .onAppear {getMenuData()}
        .padding(.all)
    }
}

#Preview {
    Menu()
}
