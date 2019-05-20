//
//  UITabBarController+Extension.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-17.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

extension UITabBarController {
    func createNavController(vc: UIViewController, unselected: String, selected: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        
        navController.navigationBar.barTintColor = UIColor.mainBlue
        //navController.navigationBar.isTranslucent = false
        navController.navigationBar.tintColor = UIColor.white
        
        navController.tabBarItem.image = UIImage(named: unselected)
        navController.tabBarItem.selectedImage = UIImage(named: selected)
        return navController
    }
}