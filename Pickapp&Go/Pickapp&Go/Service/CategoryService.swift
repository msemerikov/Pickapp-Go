//
//  CategoryService.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 20.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

protocol CategoriesServiceProtocol {
    func get() -> AnyPublisher<[Category], Error>
    func getSubcat(parentCategoryId: String?) -> AnyPublisher<[Category], Error>
    func getProducts(categoryId: String?) -> AnyPublisher<[Product], Error>
}

final class CategoriesService: CategoriesServiceProtocol {
    
    func get() -> AnyPublisher<[Category], Error> {
        var dataTask: URLSessionDataTask?
        
        let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
        let onCancel: () -> Void = { dataTask?.cancel() }
        
        return Future<[Category], Error> { [weak self] promise in
            guard let urlRequest = self?.getUrlRequest(parentCategoryId: nil) else {
                promise(.failure(ServiceError.urlRequest))
                return
            }
            
            dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                guard let data = data else {
                    if let error = error {
                        promise(.failure(error))
                    }
                    return
                }
                do {
                    let json = try JSONDecoder().decode([Category].self, from: data)
                    let categories = json.filter { $0.parentId == "0" }
                    promise(.success(categories))
                } catch {
                    promise(.failure(ServiceError.decode))
                }
            }
        }
        .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func getSubcat(parentCategoryId: String?) -> AnyPublisher<[Category], Error> {
        var dataTask: URLSessionDataTask?
        
        let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
        let onCancel: () -> Void = { dataTask?.cancel() }
        
        return Future<[Category], Error> { [weak self] promise in
            guard let urlRequest = self?.getUrlRequest(parentCategoryId: parentCategoryId) else {
                promise(.failure(ServiceError.urlRequest))
                return
            }
            
            dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                guard let data = data else {
                    if let error = error {
                        promise(.failure(error))
                    }
                    return
                }
                do {
                    let categories = try JSONDecoder().decode(CategoryData.self, from: data)
                    promise(.success(categories.subcategories))
                } catch {
                    promise(.failure(ServiceError.decode))
                }
            }
        }
        .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func getProducts(categoryId: String?) -> AnyPublisher<[Product], Error> {
        var dataTask: URLSessionDataTask?
        
        let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
        let onCancel: () -> Void = { dataTask?.cancel() }
        
        return Future<[Product], Error> { [weak self] promise in
            guard let urlRequest = self?.getUrlRequest(parentCategoryId: categoryId) else {
                promise(.failure(ServiceError.urlRequest))
                return
            }
            
            dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                guard let data = data else {
                    if let error = error {
                        promise(.failure(error))
                    }
                    return
                }
                do {
                    let categories = try JSONDecoder().decode(ProductData.self, from: data)
                    promise(.success(categories.goods))
                } catch {
                    promise(.failure(ServiceError.decode))
                }
            }
        }
        .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    private func getUrlRequest(parentCategoryId: String?) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pickappngo.website"
        components.path = "/rest/categories"
        
        if let parentCategoryId = parentCategoryId, !parentCategoryId.isEmpty {
            components.queryItems = [
                URLQueryItem(name: "id", value: parentCategoryId)
            ]
        }
        
        guard let url = components.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = 10.0
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
}
