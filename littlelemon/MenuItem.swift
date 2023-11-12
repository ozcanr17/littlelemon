//
//  MenuItem.swift
//  littlelemon
//
//  Created by Rıdvan on 12.11.2023.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
}
