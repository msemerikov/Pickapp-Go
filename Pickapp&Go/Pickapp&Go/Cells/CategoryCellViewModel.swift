//
//  CategoryCellViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
//import Firebase
import UIKit

final class CategoryCellViewModel {
//    @Published var category: Category
//    @Published var urlImage: URL?
    @Published var title: String
    @Published var image: UIImage
    
    init(title: String, image: UIImage) {
//        self.category = category
        self.title = title
        self.image = image
//        setUpBindings()
    }
    
    private func setUpBindings() {
        
    }
}

/*
struct CategoryCellViewModel {

    let category: Category
//    let title: String
//    let image: UIImage
    
}
*/
