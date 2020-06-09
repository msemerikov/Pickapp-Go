//
//  CategoryViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 26.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Firebase
import Foundation

final class CategoryViewModel {

    let db = Firestore.firestore()
    let storage = Storage.storage()
    var category: Category?
    var products: [Product] = []
    var subcategories: [Subcategory] = []
    
    @Published var selectedSubcategory: [Subcategory] = []
    @Published private(set) var subcategoryViewModels: [SubcategoryCellViewModel] = []
    @Published private(set) var productViewModels: [ProductCellViewModel] = []
    
    func loadProduct() {
        guard let id = category?.id else { return }
        let docRef = db.collection("categories").document(id)
        
        db.collection("subcategories").whereField("parent", isEqualTo: docRef)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        guard let title = document.data()["title"] as? String,
                            let category = self.category else { return }
                        
                        let subcategory = Subcategory(title: title, image: "", parent: category)
                        self.subcategoryViewModels.append(SubcategoryCellViewModel(subcategory: subcategory))
                    }
                }
        }
        
        db.collection("products").whereField("category", isEqualTo: docRef)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print(document.documentID)
                        guard let title = document.data()["title"] as? String,
                            let subtitle = document.data()["subtitle"] as? String,
                            let image = document.data()["image"] as? String,
                            let description = document.data()["description"] as? String,
                            let price = document.data()["price"] as? Double,
                            let unit = document.data()["unit"] as? String,
                            let category = self.category,
                            let subcategory = document.data()["subcategory"] as? DocumentReference else { return }
                        print(document.data()["subcategory"])
                        print(subcategory.documentID)
                        let docRef = self.db.collection("subcategories").document(subcategory.documentID)
                        print(docRef.path)
                        
//                        let product = Product(title: title, subtitle: subtitle, image: image, description: description, price: price, unit: unit, category: category, subcategory: subcategory, isFavorite: false)
//                        self.subcategoryViewModels.append(SubcategoryCellViewModel(subcategory: subcategory))
                    }
                }
        }

        
        products.removeAll()
        productViewModels.removeAll()
        selectedSubcategory.removeAll()
        products = productsArray.filter { $0.category.title == category?.title }
        
        products.forEach {
            productViewModels.append(ProductCellViewModel(product: $0))
        }

    }
    
    func addSubcategory(_ index: Int) {
        let subcategory = subcategories[index]
        selectedSubcategory.append(subcategory)
        filterBySubcategory()
    }
    
    func removeSubcategory(_ index: Int) {
        let subcategory = subcategories[index]
        guard let removeIndex = selectedSubcategory.firstIndex(where: { $0.title == subcategory.title }) else { return }
        selectedSubcategory.remove(at: removeIndex)
        filterBySubcategory()
    }
    
    func filterBySubcategory() {
        products.removeAll()
        productViewModels.removeAll()
        selectedSubcategory.forEach { subcategory in
            products = productsArray.filter { $0.subcategory.title == subcategory.title }
            products.forEach {
                productViewModels.append(ProductCellViewModel(product: $0))
            }
        }
        
    }
    
}
