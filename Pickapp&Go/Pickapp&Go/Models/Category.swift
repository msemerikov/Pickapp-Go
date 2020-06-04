//
//  Category.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Category: ListCellable {
    var title: String
    var image: String
}

let vegetablesCat = Category(title: "Овощи и фрукты", image: "Category1")
let milkCat = Category(title: "Молочные продукты", image: "Category2")
let fruitCat = Category(title: "Фрукты", image: "Category3")
let fishCat = Category(title: "Рыба", image: "Category4")
let meatCat = Category(title: "Мясные продукты", image: "Category5")
let bakeryCat = Category(title: "Кондитерские изделия", image: "Category6")
let groceryCat = Category(title: "Бакалея", image: "Category7")
//let categoriesArray = [vegetablesCat, milkCat, fishCat, meatCat, bakeryCat, groceryCat]
//var categoriesArray: [Category] = []
/*
extension Category: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        image = try container.decode(String.self, forKey: .image)
    }
}

struct CategoryData {
    let data: [Category]
}

extension CategoryData: Decodable {
    private enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([Category].self, forKey: .data)
    }
}
*/
