//
//  Order.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

class Order {
    var id: Int
    var date: String
    var status: String
    var price: Double
    var shop: Shop
    var products: [Product]
    
    init(id: Int, date: String, status: String, price: Double, shop: Shop, products: [Product]) {
        self.id = id
        self.date = date
        self.status = status
        self.price = price
        self.shop = shop
        self.products = products
    }
}

var order1 = Order(id: 12311, date: "12.06.2020", status: "Заказ получен", price: 2244.03, shop: victoriaShop, products: [greenApple, blueberry, strawberry, kiwi, blueberry, strawberry])
var order2 = Order(id: 12312, date: "31.05.2020", status: "Заказ получен", price: 2244.03, shop: victoriaShop, products: [greenApple, blueberry, strawberry, kiwi, blueberry, strawberry])
var order3 = Order(id: 12313, date: "30.04.2020", status: "Заказ отменен", price: 2244.03, shop: victoriaShop, products: [greenApple, blueberry, strawberry, kiwi, blueberry, strawberry])
var order4 = Order(id: 12314, date: "25.05.2020", status: "Оформляется", price: 2244.03, shop: victoriaShop, products: [greenApple, blueberry, strawberry, kiwi, blueberry, strawberry])
var order5 = Order(id: 12315, date: "16.05.2020", status: "Заказ получен", price: 2244.03, shop: victoriaShop, products: [greenApple, blueberry, strawberry, kiwi, blueberry, strawberry])
let ordersArray = [order1, order2, order3, order4, order5]
