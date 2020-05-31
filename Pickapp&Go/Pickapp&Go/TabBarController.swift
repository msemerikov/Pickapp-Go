//
//  TabBarController.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.tintColor = .vividOrange
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.barTintColor = .white
        createTabBarController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createTabBarController() {
        
        let firstVc = MainViewController()
        firstVc.tabBarItem = UITabBarItem(title: "Домой", image: UIImage(named: "HomeTabBarIcon"), tag: 0)
        
        let secondVc = CategoryListViewController()
        secondVc.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(named: "CatalogTabBarIcon"), tag: 1)
        
        let thirdVc = FavoriteViewControler()
        thirdVc.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "FavoriteTabBarIcon"), tag: 2)
        
        let fourthVc = CartViewController()
        fourthVc.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "BasketTabBarIcon"), tag: 3)
        fourthVc.tabBarItem.badgeValue = String(totalItemsInCart)
        
        let fifthVc = AccountViewController()
        fifthVc.tabBarItem = UITabBarItem(title: "Аккаунт", image: UIImage(named: "AccountTabBarIcon"), tag: 4)
        
        let controllerArray = [firstVc, secondVc, thirdVc, fourthVc, fifthVc]
        self.viewControllers = controllerArray.map { UINavigationController(rootViewController: $0) }
        
    }
    
}
