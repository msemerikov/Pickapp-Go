//
//  PlaceOrderViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 31.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class PlaceOrderViewController: UIViewController {
    private lazy var contentView = PlaceOrderView()
    private let viewModel: PlaceOrderViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: PlaceOrderViewModel = PlaceOrderViewModel()) {
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
        viewModel.loadProduct()
        contentView.totalValueLabel.text = "\(String(format: "%.0f", arguments: [viewModel.totalValue])) ₽"
    }
    
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = contentView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        contentView.scrollView.contentSize = CGSize(width: contentRect.size.width, height: contentRect.size.height + 24)
    }
    
    private func setUpTargets() {
        contentView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        contentView.payButton.addTarget(self, action: #selector(pay), for: .touchUpInside)
        contentView.applePaySwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        contentView.cardSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        contentView.cashSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
            contentView.commentTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.comment, on: viewModel)
                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
            
            viewModel.statusCommentTextField
                .receive(on: RunLoop.main)
                .assign(to: \.status, on: contentView.commentTextField)
                .store(in: &bindings)
            
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc func switchStateDidChange(_ sender: UISwitch) {

        if sender == contentView.applePaySwitch {
            contentView.cardSwitch.isOn = false
            contentView.cashSwitch.isOn = false
        } else if sender == contentView.cardSwitch {
            contentView.applePaySwitch.isOn = false
            contentView.cashSwitch.isOn = false
        } else if sender == contentView.cashSwitch {
            contentView.applePaySwitch.isOn = false
            contentView.cardSwitch.isOn = false
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pay() {
        let viewController = OrderEndViewController()
        navigationController?.pushViewController(viewController, animated: true)
        cartArray.removeAll()
        totalItemsInCart = 0
        self.tabBarController?.hideBadge(indexOfTab: 3)
    }
    
}
