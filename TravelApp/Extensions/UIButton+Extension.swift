//
//  UIButton+Extension.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

extension UIButton {
    
    public convenience init(title: String, borderColor: UIColor) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: Device.IS_IPHONE ? 18 : 36), .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = Device.IS_IPHONE ? 5 : 10
        self.layer.borderWidth = Device.IS_IPHONE ? 1 : 2
        self.layer.borderColor = borderColor.cgColor
        self.setAnchor(width: 0, height: Device.IS_IPHONE ? 40 : 80)
    }
    
    public convenience init(title: String, color: UIColor?, filled: Bool) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: AppFonts.BTN_FONT!, .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = Device.IS_IPHONE ? 30 : 60
        self.layer.borderWidth = 2
        self.layer.borderColor = color?.cgColor
        self.backgroundColor = filled ? color : .clear
        self.setAnchor(width: 0, height: Device.IS_IPHONE ? 60 : 120)
    }
    
    public convenience init(title: String, color: UIColor) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: Device.IS_IPHONE ? 14 : 28), .foregroundColor: color]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = Device.IS_IPHONE ? 5 : 10
        self.translatesAutoresizingMaskIntoConstraints = true
        self.layer.borderWidth = Device.IS_IPHONE ? 2 : 3
        self.backgroundColor = .clear
        self.layer.borderColor = color.cgColor
    }
    
    
}
