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
        
        let firstController = createNavController(vc: HomeController(), unselected: "first_unselected", selected: "first_selected")
        firstController.tabBarItem.title = "First".localized
        let secondController = createNavController(vc: SecondController(), unselected: "second_unselected", selected: "second_selected")
        secondController.tabBarItem.title = "Second".localized
        let thirdController = createNavController(vc: ThirdController(), unselected: "third_unselected", selected: "third_selected")
        thirdController.tabBarItem.title = "Third".localized
        let fourthController = createNavController(vc: FourthController(), unselected: "fourth_unselected", selected: "fourth_selected")
        fourthController.tabBarItem.title = "Fourth".localized
        let fifthController = createNavController(vc: FifthController(), unselected: "fifth_unselected", selected: "fifth_selected")
        fifthController.tabBarItem.title = "Czat".localized
        
        //list, add, map, favorite, account
        viewControllers = [firstController, secondController, thirdController, fourthController, fifthController]
        
        //set top margin
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
