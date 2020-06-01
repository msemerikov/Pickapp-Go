//
//  FeddbackViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class FeddbackViewModel {
    
    @Published var shop: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    
    var validatedPhone: AnyPublisher<Bool, Never> {
        $phone
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone.count == 12
        }
        .eraseToAnyPublisher()
    }
    
    var statusShopTextField: AnyPublisher<StatusTextField, Never> {
        $shop
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { name in
                switch name.count {
                case 0:
                    return .inactive
                default:
                    return .active
                }

        }
        .eraseToAnyPublisher()
    }
    
    var statusPhoneTextField: AnyPublisher<StatusTextField, Never> {
        $phone
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                switch phone.count {
                case 0:
                    return .inactive
                case 1 ... 12:
                    return .active
                default:
                    return .error
                }

        }
        .eraseToAnyPublisher()
    }
    
    var statusEmailTextField: AnyPublisher<StatusTextField, Never> {
        $email
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                switch email.count {
                case 0:
                    return .inactive
                default:
                    if email.isValidEmail {
                        return .active
                    } else {
                        return .error
                    }
                    
                }

        }
        .eraseToAnyPublisher()
    }
    
}
