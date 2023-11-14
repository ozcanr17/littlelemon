//
//  Menu.swift
//  littlelemon
//
//  Created by Rıdvan on 12.11.2023.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var selectedCategory: Category = .all
    @State private var firstAppear: Bool = true
    @State private var searchText: String = ""

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
    
    func buildPredicate() -> NSPredicate {
        var predicates = [NSPredicate]()

        if !searchText.isEmpty {
            predicates.append(NSPredicate(format: "title CONTAINS[cd] %@", searchText))
        }

        if selectedCategory != .all {
            predicates.append(NSPredicate(format: "category == %@", selectedCategory.rawValue))
        }

        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    func buildSortDescriptor() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }

    @FetchRequest(
        entity: Dish.entity(),
        sortDescriptors: [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    )
    
    
    var dishes: FetchedResults<Dish>

    enum Category: String {
        case all = "all"
        case starters = "starters"
        case mains = "mains"
        case desserts = "desserts"
        case drinks = "drinks"
    }
    
    var filteredDishes: [Dish] {
            if selectedCategory == .all {
                return Array(dishes)
            } else {
                return dishes.filter { $0.category == selectedCategory.rawValue }
            }
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
                Spacer()
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
                HStack(alignment: .center){
                    VStack(alignment: .leading) {
                        Text("We are family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .frame(width: 200, height: 150)
                    }
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 160)
                        .cornerRadius(20)
                        .offset(y: -20)
                }
                TextField("Search...", text: $searchText)
                    .padding(.horizontal)
                    .frame(width: 400, height: 40)
                    .textFieldStyle(.roundedBorder)
                HStack {
                    Text("ORDER FOR DELIVERY!")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        let categories: [Category] = [.all, .starters, .mains, .desserts, .drinks]
                        ForEach(categories, id: \.self) { category in
                            Button(category.rawValue) {
                                selectedCategory = category
                            }
                            .foregroundColor(.teal)
                            .fontWeight(.bold)
                            .padding()
                            .frame( height: 30)
                            .background(Color.green.opacity(0.05))
                            .cornerRadius(10)
                        }
                    }
                }
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptor()) {(filteredDishes: [Dish]) in
                    List(filteredDishes) { dish in
                        HStack() {
                            VStack(alignment: .leading) {
                                Text(dish.title ?? "N/A")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text(dish.desc ?? "N/A")
                                    .font(.caption)
                                Text("$\(dish.price ?? "N/A")")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .interpolation(.low)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(5)
                                case .failure(_):
                                    Text("Failed!")
                                        .frame(width: 80, height: 80)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(5)
                                case .empty:
                                    Text("Loading..")
                                        .frame(width: 80, height: 80)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(5)
                                @unknown default:
                                    fatalError()
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear {
                if firstAppear {
                    getMenuData()
                    firstAppear = false
                }
            }
            .padding(.all)
        }
    }

#Preview {
    Menu()
}
