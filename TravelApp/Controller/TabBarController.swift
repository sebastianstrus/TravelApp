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
        
        let firstController = createNavController(vc: HomeController(), unselected: "trips_unselected", selected: "trips_selected")
        firstController.tabBarItem.title = "Trips".localized
        let secondController = createNavController(vc: SecondController(), unselected: "second_unselected", selected: "trips_icon")
        secondController.tabBarItem.title = "Second".localized
        let thirdController = createNavController(vc: ThirdController(), unselected: "third_unselected", selected: "third_selected")
        thirdController.tabBarItem.title = "Third".localized
        let chatController = createNavController(vc: ChatController(), unselected: "chat_unselected", selected: "chat_selected")
        chatController.tabBarItem.title = "Chat".localized
        
        //list, add, map, favorite, account
        viewControllers = [firstController, secondController, thirdController, chatController]
        
        //set top margin
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
        }
    }
}
