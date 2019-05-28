//
//  TabBarController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-17.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // TODO: add images with two colors
    func setupTabBar() {
        tabBar.barTintColor = UIColor.mainBlue
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.unselectedTabGray
        tabBar.isTranslucent = false
        
        let homeController = createNavController(vc: HomeController(), image: "trips_icon")
        homeController.tabBarItem.title = "Trips".localized
        
        let vouchersController = createNavController(vc: VouchersController(), image: "discount_icon")
        vouchersController.tabBarItem.title = "Vouchers".localized
        
        let chatController = createNavController(vc: ChatController(), image: "chat_icon")
        chatController.tabBarItem.title = "Chat".localized
        
        let accountController = createNavController(vc: AccountController(), image: "account_icon")
        accountController.tabBarItem.title = "Account".localized
        
        //list, add, map, favorite, account
        viewControllers = [homeController, vouchersController, chatController, accountController]
        
        //set top margin
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
        }
    }
}
