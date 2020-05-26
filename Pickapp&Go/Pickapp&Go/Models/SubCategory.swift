//
//  SubCategory.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Subcategory: ListCellable {
    var title: String
    var image: String
    var parent: Category
}

let vegetables = Subcategory(title: "Овощи", image: "", parent: vegetablesCat)
let fruits = Subcategory(title: "Фрукты", image: "", parent: vegetablesCat)
let berries = Subcategory(title: "Ягоды", image: "", parent: vegetablesCat)
let milk = Subcategory(title: "Молоко", image: "", parent: milkCat)
let cream = Subcategory(title: "Сметана", image: "", parent: milkCat)
let cheeses = Subcategory(title: "Сыр", image: "", parent: milkCat)
let pasta = Subcategory(title: "Макароны", image: "", parent: groceryCat)
let cereals = Subcategory(title: "Крупа", image: "", parent: groceryCat)
let teas = Subcategory(title: "Чай", image: "", parent: groceryCat)
let beef = Subcategory(title: "Говядина", image: "", parent: meatCat)
let pork = Subcategory(title: "Свинина", image: "", parent: meatCat)
let chicken = Subcategory(title: "Курица", image: "", parent: meatCat)
let subcategoriesArray = [vegetables, fruits, berries, milk, cream, cheeses, pasta, cereals, teas, beef, pork, chicken]
