//
//  AccountViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class AccountViewController: UIViewController {
    private lazy var contentView = AccountView()
    private let viewModel: AccountViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: AccountViewModel = AccountViewModel()) {
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "LogoutIcon"), style: .plain, target: self, action: #selector(logoutTapped))
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setUpTargets() {
        contentView.exitButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        let tapStoryLabel = UITapGestureRecognizer(target: self, action: #selector(handleAttachmentTap(_:)))
        let tapSupportLabel = UITapGestureRecognizer(target: self, action: #selector(handleAttachmentTap(_:)))
        contentView.storyLabel.addGestureRecognizer(tapStoryLabel)
        contentView.supportLabel.addGestureRecognizer(tapSupportLabel)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.nameTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.name, on: viewModel)
                .store(in: &bindings)
            
//            contentView.lastnameTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.lastname, on: viewModel)
//                .store(in: &bindings)
            
            contentView.birthdateTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.birthdate, on: viewModel)
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
            
            viewModel.statusNameTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.nameTextField)
                .store(in: &bindings)
            
//            viewModel.statusLastnameTextField
//                .receive(on: RunLoop.main)
//                .assign(to: \.status, on: contentView.lastnameTextField)
//                .store(in: &bindings)
            
            viewModel.statusBirthdateTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.birthdateTextField)
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
    
    @objc func handleAttachmentTap(_ sender: UITapGestureRecognizer) {
        if sender.view == contentView.storyLabel {
            let viewController = OrderListViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if sender.view == contentView.supportLabel {
            let viewController = FeedbackViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @objc private func logoutTapped() {
        print("Logout")
    }
    
}
