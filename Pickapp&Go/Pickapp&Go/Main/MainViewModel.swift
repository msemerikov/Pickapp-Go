//
//  MainViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Firebase
import UIKit

final class MainViewModel {
    
    let db = Firestore.firestore()
    let storage = Storage.storage()

    @Published private(set) var shopViewModels: [ShopCellViewModel] = [
        ShopCellViewModel(shop: victoriaShop)
    ]
    @Published private(set) var categoryViewModels: [CategoryCellViewModel] = []
    @Published private(set) var buyerChoiceViewModels: [ProductCellViewModel] = []
    @Published private(set) var newProductViewModels: [ProductCellViewModel] = []
    @Published private(set) var salesViewModels: [ProductCellViewModel] = []

    
    func loadCategory() {
        
        buyerChoiceArray.forEach {
            buyerChoiceViewModels.append(ProductCellViewModel(product: $0))
        }
        
        newProductArray.forEach {
            newProductViewModels.append(ProductCellViewModel(product: $0))
        }
        
        salesProductArray.forEach {
            salesViewModels.append(ProductCellViewModel(product: $0))
        }
        
        db.collection("categories").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    guard let title = document.data()["title"] as? String,
                        let image = document.data()["image"] as? String else { return }
                    
                    let category = Category(id: document.documentID, title: title, image: image)
                    let gsReference = self.storage.reference(forURL: image)
                    
                    gsReference.downloadURL { url, error in
                        if let error = error {
                            print(error)
                        } else {
                            if let imageData: NSData = NSData(contentsOf: url!) {
                                self.categoryViewModels.append(CategoryCellViewModel(category: category, image: UIImage(data: imageData as Data)!))
                            }
                        }
                    }
                }
            }
        }
    }
    
}
