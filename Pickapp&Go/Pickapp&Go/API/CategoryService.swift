//
//  CategoryService.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 04.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//
/*
import Firebase
import Foundation
import Combine

enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

protocol CategoriesServiceProtocol {
    func get() -> Future<[Category], Error>
}

let apiKey = "AIzaSyAILolY5qR7WwpcPawHBshhkhXe9xyz8zA"

final class CategoriesService: CategoriesServiceProtocol {
    
    /*
     db.collection("categories").getDocuments() { (querySnapshot, err) in
     if let err = err {
     print("Error getting documents: \(err)")
     } else {
     for document in querySnapshot!.documents {
     let category = Category(title: document.data()["title"] as! String, image: document.data()["image"] as! String)
     let gsReference = self.storage.reference(forURL: document.data()["image"] as! String)
     
     gsReference.downloadURL { url, error in
     if let error = error {
     print(error)
     } else {
     if let imageData: NSData = NSData(contentsOf: url!) {
     self.categoryViewModels.append(CategoryCellViewModel(category: category, title: category.title, image: UIImage(data: imageData as Data)!))
     }
     }
     }
     }
     }
     }
     */
    
    
    func get() -> Future<[Category], Error> {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        var categories: [Category] = []
        
        //        let onSubscription: (Subscription) -> Void = { _ in db.collection("categories").getDocuments(completion: <#FIRQuerySnapshotBlock#>) }
        //        let onCancel: () -> Void = { /*dataTask?.cancel()*/ }
        
        return Future<[Category], Error> { [weak self] promise in
            db.collection("categories").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let category = Category(title: document.data()["title"] as! String, image: document.data()["image"] as! String)
                        let gsReference = storage.reference(forURL: document.data()["image"] as! String)
                        
                        gsReference.downloadURL { url, error in
                            if let error = error {
                                print(error)
                                promise(.failure(ServiceError.urlRequest))
                            } else {
                                categories.append(category)
                                promise(.success(categories))
                                //                                if let imageData: NSData = NSData(contentsOf: url!) {
                                //                                    self.categoryViewModels.append(CategoryCellViewModel(category: category))
                                //                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
/*
 var dataTask: URLSessionDataTask?
 
 let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
 let onCancel: () -> Void = { dataTask?.cancel() }
 
 return Future<[Category], Error> { [weak self] promise in
 guard let urlRequest = self?.getUrlRequest() else {
 promise(.failure(ServiceError.urlRequest))
 return
 }
 
 dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
 
 guard let data = data else {
 if let error = error {
 promise(.failure(error))
 }
 return
 }
 do {
 var categories: [Category] = []
 guard let json = String(data: data, encoding: String.Encoding.utf8) else { return }
 print(json)
 let jsonObjectAny: Any = try JSONSerialization.jsonObject(with: data, options: [])
 let jsonObject = jsonObjectAny as? [String: Any]
 jsonObject?.forEach { _ in
 guard let title = jsonObject?["title"] as? String,
 let image = jsonObject?["image"] as? String else {
 promise(.failure(ServiceError.decode))
 return
 }
 let category = Category(title: title, image: image)
 categories.append(category)
 }
 
 
 
 
 //                    let categories = try JSONDecoder().decode(CategoryData.self, from: data)
 //                    let categories = [vegetablesCat, milkCat, fishCat, meatCat, bakeryCat, groceryCat]
 promise(.success(categories))
 } catch {
 promise(.failure(ServiceError.decode))
 print("3")
 }
 }
 }
 .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
 .receive(on: DispatchQueue.main)
 .eraseToAnyPublisher()
 }
 
 private func getUrlRequest() -> URLRequest? {
 var components = URLComponents()
 components.scheme = "https"
 components.host = "pickappgo.firebaseio.com"
 components.path = "/categories.json"
 //        if let searchTerm = searchTerm, !searchTerm.isEmpty {
 //            components.queryItems = [
 //                URLQueryItem(name: "search", value: searchTerm)
 //            ]
 //        }
 
 guard let url = components.url else { return nil }
 
 var urlRequest = URLRequest(url: url)
 urlRequest.timeoutInterval = 10.0
 urlRequest.httpMethod = "GET"
 //        urlRequest.allHTTPHeaderFields = [
 //            "key": apiKey
 //        ]
 print("urlRequest \(urlRequest)")
 return urlRequest
 }
 */

/*
 AIzaSyCdp0rSu2rkUF2zPWmU8hLMToNvlPzrkT8
 let storage = Storage.storage()
 let ref = Database.database().reference()
 
 ref.child("categories").observe(.value, with: { (snapshot) in
 let postDict = snapshot.value as? [String : AnyObject] ?? [:]
 
 for finalObj in postDict {
 guard let obj = finalObj.value as? [String: AnyObject] else { return }
 guard let title = obj["title"] as? String,
 let image = obj["image"] as? String else { return }
 let category = Category(title: title, image: image)
 let gsReference = self.storage.reference(forURL: obj["image"] as! String)
 gsReference.downloadURL { url, error in
 if let error = error {
 print(error)
 } else {
 if let imageData: NSData = NSData(contentsOf: url!) {
 self.categoryViewModels.append(CategoryCellViewModel(category: category, title: category.title, image: UIImage(data: imageData as Data)!))
 }
 }
 }
 }
 })
 
 let userID = Auth.auth().currentUser?.uid
 ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
 // Get user value
 let value = snapshot.value as? NSDictionary
 let username = value?["username"] as? String ?? ""
 let user = User(username: username)
 
 // ...
 }) { (error) in
 print(error.localizedDescription)
 }
 */
*/
