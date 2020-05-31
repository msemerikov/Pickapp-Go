//
//  PlaceOrderViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class PlaceOrderViewModel {

    @Published private(set) var shop: Shop?
    @Published private(set) var totalValue: Double = 0
    @Published var comment: String = ""
    
    func loadProduct() {
        totalValue = 0
        
        cartArray.forEach {
            totalValue += $0.amount
        }
    }
    
    var statusCommentTextField: AnyPublisher<StatusTextField, Never> {
        $comment
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { comment in
                switch comment.count {
                case 0:
                    return .inactive
                default:
                    return .active
                }

        }
        .eraseToAnyPublisher()
    }
    
}
