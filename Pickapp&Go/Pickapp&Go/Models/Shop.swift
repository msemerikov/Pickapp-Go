//
//  Shop.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

protocol ListCellable {
    var title: String { get set }
    var image: String { get set }
}

struct Shop: ListCellable {
    var title: String
    var image: String
    var address: String
}

var victoriaShop = Shop(title: "Виктория", image: "ShopLogo", address: "Долгопрудная, 74 ТРК “Облака”")
