//
//  CategoryListViewController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 08.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

final class CategoryListViewController: UIViewController {
    private lazy var contentView = CategoryListView()
    private let viewModel: CategoryListViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: CategoryListViewModel = CategoryListViewModel()) {
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
        view.backgroundColor = .darkGray
        setUpTableView()
        setUpBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.title = "Категории"
    }
    
    private func setUpTableView() {
        contentView.tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    private func setUpBindings() {
//        func bindViewToViewModel() {
//            contentView.searchTextField.textPublisher
//                .debounce(for: 0.5, scheduler: RunLoop.main)
//                .removeDuplicates()
//                .assign(to: \.searchText, on: viewModel)
//                .store(in: &bindings)
//        }
//
//        func bindViewModelToView() {
//            let viewModelsValueHandler: ([PlayerCellViewModel]) -> Void = { [weak self] _ in
//                self?.contentView.tableView.reloadData()
//            }
//
//            viewModel.$playersViewModels
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: viewModelsValueHandler)
//                .store(in: &bindings)
//
//            let stateValueHandler: (ListViewModelState) -> Void = { [weak self] state in
//                switch state {
//                case .loading:
//                    self?.contentView.startLoading()
//                case .finishedLoading:
//                    self?.contentView.finishLoading()
//                case .error(let error):
//                    self?.contentView.finishLoading()
//                    self?.showError(error)
//                }
//            }
//
//            viewModel.$state
//                .receive(on: RunLoop.main)
//                .sink(receiveValue: stateValueHandler)
//                .store(in: &bindings)
//        }
//
//        bindViewToViewModel()
//        bindViewModelToView()
    }
    
    private func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoriesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier, for: indexPath)
        guard let cell = dequeuedCell as? ListCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.viewModel = viewModel.categoriesViewModels[indexPath.row]
        return cell
    }
    
}
