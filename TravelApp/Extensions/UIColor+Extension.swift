//
//  UIColor+Extension.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    class var unselectedTabGray: UIColor { return UIColor(r: 100, g: 100, b: 100)}
    class var mainBlue: UIColor { return UIColor(r: 105, g: 159, b: 221)}
    class var greyText: UIColor { return UIColor(r: 86, g: 86, b: 86)}
    
    var GREEN_BORDER: UIColor { return UIColor(r: 80, g: 227, b: 194)}
    var RED_BORDER: UIColor { return UIColor(r: 204, g: 0, b: 0)}
    var DODGER_BLUE: UIColor { return UIColor(r: 30, g: 144, b: 255)}
    var SILVER_GREY: UIColor { return UIColor(r: 245, g: 245, b: 245)}
    class var MAIN_PURPLE: UIColor { return UIColor(r: 230, g: 36, b: 229)}
}
