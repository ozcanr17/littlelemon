//
//  Menu.swift
//  littlelemon
//
//  Created by Rıdvan on 12.11.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let menuURL: URL = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let reqURL = URLRequest(url: menuURL)
        let task = URLSession.shared.dataTask(with: reqURL) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let fullMenu = try decoder.decode(MenuList.self, from: data)
                    for item in fullMenu.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.desc = item.description
                        dish.category = item.category
                        try? viewContext.save()
                    }
                } catch {
                    print("Error decoding: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
        
    }
    
    @FetchRequest(
        entity: Dish.entity(),
        sortDescriptors:
            [NSSortDescriptor(keyPath: \Dish.title, ascending: true)])
    var dishes: FetchedResults<Dish>
    
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
                }
                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .cornerRadius(20)
                Spacer()
            }
            List {
                ForEach(dishes) { dish in
                    VStack {
                        Text("Title: \(dish.title ?? "No title")")
                    }
                }
            }
        }
        .onAppear {getMenuData()}
        .padding(.all)
    }
}

//#Preview {
//    Menu()
//}
