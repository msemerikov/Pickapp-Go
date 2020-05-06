//
//  LoginViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 05.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class LoginViewController: UIViewController {
    private lazy var contentView = LoginView()
    private let viewModel: LoginViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setUpTargets() {
        contentView.loginButton.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
        contentView.guestButton.addTarget(self, action: #selector(onClickGuest), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.phoneTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.phone, on: viewModel)
                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            viewModel.validatedPhone
                .receive(on: RunLoop.main)
                .assign(to: \.isValid, on: contentView.loginButton)
                .store(in: &bindings)
            
            viewModel.statusTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.phoneTextField)
                .store(in: &bindings)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc private func onClickLogin() {
        guard let phone = contentView.phoneTextField.textField.text else { return }
        let viewController = ConfirmationViewController()
        viewController.phone = phone
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func onClickGuest() {
            print("Guest")
        }
}
