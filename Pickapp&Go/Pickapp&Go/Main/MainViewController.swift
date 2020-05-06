//
//  MainViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class MainViewController: UIViewController {
    private lazy var contentView = MainView()
    private let viewModel: MainViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: MainViewModel = MainViewModel()) {
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
        setupEventsCollectionView()
        setupCategoryCollectionView()
//        setUpTargets()
//        setUpBindings()
//        viewModel.startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupEventsCollectionView() {
        contentView.eventsCollectionView.register(EventsCollectionViewCell.self, forCellWithReuseIdentifier: EventsCollectionViewCell.identifier)
        contentView.eventsCollectionView.dataSource = self
        contentView.eventsCollectionView.delegate = self
    }
    
    private func setupCategoryCollectionView() {
        contentView.categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        contentView.categoryCollectionView.dataSource = self
        contentView.categoryCollectionView.delegate = self
    }
    
    private func setUpTargets() {
//        contentView.loginButton.addTarget(self, action: #selector(onClickLogin), for: .touchUpInside)
//        contentView.againButton.addTarget(self, action: #selector(onClickAgain), for: .touchUpInside)
    }
    
    private func setUpBindings() {
        func bindViewToViewModel() {
//            contentView.codeTextField.textPublisher
//                .receive(on: DispatchQueue.main)
//                .assign(to: \.code, on: viewModel)
//                .store(in: &bindings)
        }
        
        func bindViewModelToView() {
//            viewModel.validatedPhone
//                .receive(on: RunLoop.main)
//                .assign(to: \.isValid, on: contentView.loginButton)
//                .store(in: &bindings)
//
//            viewModel.statusTextField
//                .receive(on: RunLoop.main)
//                .assign(to: \.status, on: contentView.codeTextField)
//                .store(in: &bindings)
//
//            viewModel.isTimeLeft
//                .receive(on: RunLoop.main)
//                .assign(to: \.isValid, on: contentView.againButton)
//                .store(in: &bindings)
//
//            viewModel.counter
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: {
//                    switch $0 {
//                    case 0:
//                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз”"
//                    default:
//                        self.contentView.label.text = "На номер \(self.phone) отправлен код. Введите его в поле ниже. \nНе получили код? Нажмите кнопку “Отправить еще раз” через \($0) секунды"
//                    }
//                } )
//                .store(in: &bindings)
        }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc private func onClickLogin() {
//        let viewController = TabBarController()
//        navigationController?.dismiss(animated: true, completion: {
//            viewController.modalPresentationStyle = .fullScreen
//            self.present(viewController, animated: true, completion: nil)
//        })
    }
    
    @objc private func onClickAgain() {
//        viewModel.startTimer()
    }
    
}

extension MainViewController: UICollectionViewDelegate { }

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.eventsCollectionView {
            return viewModel.eventsViewModels.count
        } else {
            return viewModel.categoryViewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.eventsCollectionView {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.identifier, for: indexPath)
            
            guard let eventCell = dequeuedCell as? EventsCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            
            eventCell.viewModel = viewModel.eventsViewModels[indexPath.item]
            return eventCell
        } else {
            let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            
            guard let eventCell = dequeuedCell as? CategoryCollectionViewCell else {
                fatalError("Could not dequeue a cell")
            }
            
            eventCell.viewModel = viewModel.categoryViewModels[indexPath.item]
            return eventCell
        }
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contentView.eventsCollectionView {
            return CGSize(width: Session.width - 32, height: 123)
        } else {
            return CGSize(width: 126, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
}
