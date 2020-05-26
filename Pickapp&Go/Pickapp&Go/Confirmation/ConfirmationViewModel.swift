//
//  ConfirmationViewModel.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import Foundation

final class ConfirmationViewModel {
    
    var timer: Timer?
    @Published var code: String = ""
    @Published var timeLeft: Int = 60
    
    var validatedCode: AnyPublisher<Bool, Never> {
        $code
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone.count == 6
        }
        .eraseToAnyPublisher()
    }
    
    var statusTextField: AnyPublisher<StatusTextField, Never> {
        $code
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { code in
                switch code.count {
                case 0:
                    return .inactive
                case 1...6:
                    return .active
                default:
                    return .error
                }

        }
        .eraseToAnyPublisher()
    }
    
    var counter: AnyPublisher<Int, Never> {
        $timeLeft
            .removeDuplicates()
            .map { timeLeft in
                return timeLeft
        }
        .eraseToAnyPublisher()
    }
    
    var isTimeLeft: AnyPublisher<Bool, Never> {
        $timeLeft
            .removeDuplicates()
            .map { timeLeft in
                switch timeLeft {
                case 0:
                    return true
                default:
                    return false
                }
        }
        .eraseToAnyPublisher()
    }
    
    func startTimer() {
        timeLeft = 60
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        timeLeft -= 1
        
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
        }
        
    }
    
}
