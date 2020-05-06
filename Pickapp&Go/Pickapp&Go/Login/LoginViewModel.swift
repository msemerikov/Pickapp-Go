//
//  LoginViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class LoginViewModel {
    
    @Published var phone: String = ""
    
    var validatedPhone: AnyPublisher<Bool, Never> {
        $phone
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone.count == 12
        }
        .eraseToAnyPublisher()
    }
    
    var statusTextField: AnyPublisher<StatusTextField, Never> {
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
    
}
