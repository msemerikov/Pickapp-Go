//
//  Category.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Category: Codable {
    var id: String?
    var parentId: String?
    var title: String?
    var image: String?
    var active: String?
    var position: String?
}

extension Category {
    enum CodingKeys: String, CodingKey {
        case id
        case parentId = "parent_id"
        case title = "name"
        case image = "img_name"
        case active
        case position
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        parentId = try container.decode(String.self, forKey: .parentId)
//        title = try container.decode(String.self, forKey: .title)
//        image = try container.decode(String.self, forKey: .image)
//        active = try container.decode(String.self, forKey: .active)
//        position = try container.decode(String.self, forKey: .position)
//    }
}

struct CategoryData {
    let subcategories: [Category]
}

extension CategoryData: Decodable {
    private enum CodingKeys: String, CodingKey {
        case subcategories
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        subcategories = try container.decode([Category].self, forKey: .subcategories)
    }
}
 
let vegetablesCat = Category(id: "1", parentId: "0", title: "Овощи и фрукты", image: "Category1", position: "1")
let milkCat = Category(id: "2", parentId: "0", title: "Молочные продукты", image: "Category2", position: "2")
let fruitCat = Category(id: "3", parentId: "0", title: "Фрукты", image: "Category3", position: "3")
let fishCat = Category(id: "4", parentId: "0", title: "Рыба", image: "Category4", position: "4")
let meatCat = Category(id: "5", parentId: "0", title: "Мясные продукты", image: "Category5", position: "5")
let bakeryCat = Category(id: "6", parentId: "0", title: "Кондитерские изделия", image: "Category6", position: "6")
let groceryCat = Category(id: "7", parentId: "0", title: "Бакалея", image: "Category7", position: "7")
//let vegetablesCat = Category(title: "Овощи и фрукты", image: "Category1")
//let milkCat = Category(title: "Молочные продукты", image: "Category2")
//let fruitCat = Category(title: "Фрукты", image: "Category3")
//let fishCat = Category(title: "Рыба", image: "Category4")
//let meatCat = Category(title: "Мясные продукты", image: "Category5")
//let bakeryCat = Category(title: "Кондитерские изделия", image: "Category6")
//let groceryCat = Category(title: "Бакалея", image: "Category7")
//let categoriesArray = [vegetablesCat, milkCat, fishCat, meatCat, bakeryCat, groceryCat]
var categoriesArray: [Category] = []
