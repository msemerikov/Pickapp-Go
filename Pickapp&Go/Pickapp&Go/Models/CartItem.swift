//
//  CartItem.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Foundation

class CartItem {
    
    var product: Product
    var count: Double
    var price: Double
    var amount: Double {
        return price * count
    }
    
    init(product: Product, count: Double, price: Double) {
        self.product = product
        self.count = count
        self.price = price
    }

}

var totalItemsInCart = 0

var cartItem1 = CartItem(product: kiwi, count: 2, price: 217)
var cartItem2 = CartItem(product: banana, count: 1, price: 69.90)
var cartItem3 = CartItem(product: peach, count: 3, price: 99)
var cartItem4 = CartItem(product: strawberry, count: 1, price: 419)
var cartItem5 = CartItem(product: cucumber, count: 1, price: 99)
var cartItem6 = CartItem(product: apple, count: 1, price: 100)
