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
    
    var validatedPassword: AnyPublisher<Bool, Never> {
        
        $phone
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone.count > 10
        }
        .eraseToAnyPublisher()
        
    }
    
}
