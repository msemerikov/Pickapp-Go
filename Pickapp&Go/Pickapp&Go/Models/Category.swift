//
//  Category.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Category: ListCellable {
    var id: String?
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
