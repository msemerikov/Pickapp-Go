//
//  FeedbackViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class FeedbackViewController: UIViewController {
    private lazy var contentView = FeedbackView()
    private let viewModel: FeedbackViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: FeedbackViewModel = FeedbackViewModel()) {
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
        setUpTargets()
        setUpBindings()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        contentView.sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.messageTextView.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.message, on: viewModel)
                .store(in: &bindings)
            
            contentView.shopTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.shop, on: viewModel)
                .store(in: &bindings)
            
            contentView.phoneTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.phone, on: viewModel)
                .store(in: &bindings)
            
            contentView.emailTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.email, on: viewModel)
                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
//            viewModel.validatedPhone
//                .receive(on: RunLoop.main)
//                .assign(to: \.isValid, on: contentView.loginButton)
//                .store(in: &bindings)
            
            viewModel.statusMessageTextView
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.messageTextView)
                .store(in: &bindings)
            
            viewModel.statusShopTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.shopTextField)
                .store(in: &bindings)

            viewModel.statusPhoneTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.phoneTextField)
                .store(in: &bindings)
            
            viewModel.statusEmailTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.emailTextField)
                .store(in: &bindings)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func sendTapped() {
        print("Send")
    }
    
}
