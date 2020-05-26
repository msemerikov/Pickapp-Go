//
//  ConfirmationViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class ConfirmationViewController: UIViewController {
    var phone = ""
    var counter = 60
    private lazy var contentView = ConfirmationView()
    private let viewModel: ConfirmationViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: ConfirmationViewModel = ConfirmationViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addTapGestureToHideKeyboard()
        setUpTargets()
        setUpBindings()
        viewModel.startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setUpTargets() {
        contentView.loginButton.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
        contentView.againButton.addTarget(self, action: #selector(onClickAgain), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.codeTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.code, on: viewModel)
                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            viewModel.validatedCode
                .receive(on: RunLoop.main)
                .assign(to: \.isValid, on: contentView.loginButton)
                .store(in: &bindings)
            
            viewModel.statusTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.codeTextField)
                .store(in: &bindings)
            
            viewModel.isTimeLeft
                .receive(on: RunLoop.main)
                .assign(to: \.isValid, on: contentView.againButton)
                .store(in: &bindings)
            
            viewModel.counter
                .receive(on: RunLoop.main)
                .sink(receiveValue: {
                    switch $0 {
                    case 0:
                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз”"
                    default:
                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз” через \($0) секунды"
                    }
                } )
                .store(in: &bindings)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc private func onClickLogin() {
        let viewController = TabBarController()
        navigationController?.dismiss(animated: true, completion: {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        })
    }
    
    @objc private func onClickAgain() {
        viewModel.startTimer()
    }
    
}
