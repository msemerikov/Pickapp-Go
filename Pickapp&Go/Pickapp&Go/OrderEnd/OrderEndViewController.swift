//
//  OrderEndViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class OrderEndViewController: UIViewController {
    private lazy var contentView = OrderEndView()
    private let viewModel: OrderEndViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: OrderEndViewModel = OrderEndViewModel()) {
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
        view.backgroundColor = .backgroundColor
        setUpTargets()
        setUpBindings()
        dismissKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setUpTargets() {
        contentView.followButton.addTarget(self, action: #selector(follow), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.commentTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.comment, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            
//            viewModel.statusCommentTextField
//                .receive(on: RunLoop.main)
//                .assign(to: \.status, on: contentView.commentTextField)
//                .store(in: &bindings)
            
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc func follow() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
