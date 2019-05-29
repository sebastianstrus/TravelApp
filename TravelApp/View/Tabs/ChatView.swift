//
//  ChatView.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-22.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class ChatView: UIView {

    let pictureImageView1: CustomImageView = {
        var iv = CustomImageView()
        iv.image = UIImage(named: "profile0")
        iv.layer.cornerRadius = 12
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.mainBlue.cgColor
        return iv
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Hi Anna, how are you?"
        label.textColor = .mainBlue
        label.font = AppFonts.CHAT_FONT
        return label
    }()
    
    let pictureImageView2: CustomImageView = {
        var iv = CustomImageView()
        iv.image = UIImage(named: "profile1")
        iv.layer.cornerRadius = 12
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.mainBlue.cgColor
        return iv
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Hi Sebastian, I'm fine. I go to Panama soon."
        label.textColor = .mainBlue
        label.font = AppFonts.CHAT_FONT
        return label
    }()
    
    let pictureImageView3: CustomImageView = {
        var iv = CustomImageView()
        iv.image = UIImage(named: "profile3")
        iv.layer.cornerRadius = 12
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.mainBlue.cgColor
        return iv
    }()
    
    let label3: UILabel = {
        let label = UILabel()
        label.text = "I will go with you!"
        label.textColor = .mainBlue
        label.font = AppFonts.CHAT_FONT
        return label
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Your message"
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = UIColor.mainBlue
        iv.image = UIImage(named: "send_icon")
        return iv
    }()
    
    let pictureImageView4: CustomImageView = {
        var iv = CustomImageView()
        iv.image = UIImage(named: "profile0")
        iv.layer.cornerRadius = 12
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.mainBlue.cgColor
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(pictureImageView1)
        pictureImageView1.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        addSubview(label1)
        label1.setAnchor(top: pictureImageView1.topAnchor, leading: pictureImageView1.trailingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0)
        
        
        addSubview(pictureImageView2)
        pictureImageView2.setAnchor(top: pictureImageView1.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, paddingTop: 6, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        addSubview(label2)
        label2.setAnchor(top: pictureImageView2.topAnchor, leading: pictureImageView2.trailingAnchor, bottom: pictureImageView2.bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0)
        
        
        addSubview(pictureImageView3)
        pictureImageView3.setAnchor(top: pictureImageView2.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, paddingTop: 6, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        addSubview(label3)
        label3.setAnchor(top: pictureImageView3.topAnchor, leading: pictureImageView3.trailingAnchor, bottom: pictureImageView3.bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0)
        
        
        addSubview(imageView)
        imageView.setAnchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 8, width: 32, height: 32)
        
        addSubview(pictureImageView4)
        pictureImageView4.setAnchor(top: nil, leading: leadingAnchor, bottom: safeBottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 12, paddingRight: 0, width: 24, height: 24)
        
        
        addSubview(textField)
        textField.setAnchor(top: nil, leading: pictureImageView4.trailingAnchor, bottom: safeBottomAnchor, trailing: imageView.leadingAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 32)
    }

}
