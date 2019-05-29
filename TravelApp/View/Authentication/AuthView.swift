//
//  WelcomeView.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class AuthView: UIView {
    
    var cancelAction: (() -> Void)?
    var submitAction: (() -> Void)?

    var yCenterAnchor: NSLayoutConstraint!
    var yUpAnchor: NSLayoutConstraint!
    
    var loginHeightConstraint: NSLayoutConstraint!
    var registerHeightConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - All subviews
    fileprivate let blurView: UIVisualEffectView  = {
        let view = UIVisualEffectView (effect: nil)
        return view
    }()
    
    fileprivate let popupView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor.mainBlue.cgColor
        view.setCellShadow()
        return view
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "TravelTube"
        label.textColor = UIColor.mainBlue
        label.font = AppFonts.TITLE_FONT
        return label
    }()
    
    fileprivate let loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.selectedSegmentIndex = 0
        sc.tintColor = UIColor.mainBlue
        sc.addTarget(self, action: #selector(changeWebView), for: .valueChanged)
        return sc
    }()
    
    let nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isHidden = true
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.layer.borderColor = UIColor.mainBlue.cgColor
        return tf
    }()
    
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.layer.borderColor = UIColor.mainBlue.cgColor
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.layer.borderColor = UIColor.mainBlue.cgColor
        return tf
    }()
    
    let confirmPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.isHidden = true
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.layer.borderColor = UIColor.mainBlue.cgColor
        return tf
    }()
    
    fileprivate let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainBlue.cgColor
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.mainBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    fileprivate let loginRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainBlue.cgColor
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.mainBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Private methods
    private func setup() {
        addSubview(blurView)
        blurView.pinToEdges(view: self)
        blurView.effect = nil
        
        addSubview(popupView)
        

        popupView.setAnchor(width: 240,
                            height: 0)
        
        popupView.widthAnchor.constraint(equalToConstant: 240).isActive = true

        loginHeightConstraint = popupView.heightAnchor.constraint(equalToConstant: 228)
        registerHeightConstraint = popupView.heightAnchor.constraint(equalToConstant: 304)
        loginHeightConstraint.isActive = true
        
        popupView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
        yCenterAnchor = popupView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor)
        yUpAnchor = popupView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor, constant: -100)
        yCenterAnchor.isActive = true
        
        popupView.alpha = 0
        popupView.transform = CGAffineTransform.init(scaleX: Device.IS_IPHONE ? 2 : 4, y: Device.IS_IPHONE ? 2 : 4)
        
        popupView.addSubview(titleLabel)
        titleLabel.setAnchor(top: popupView.topAnchor,
                             leading: popupView.leadingAnchor,
                             bottom: nil,
                             trailing: popupView.trailingAnchor,
                             paddingTop: 8,
                             paddingLeft: 0,
                             paddingBottom: 0,
                             paddingRight: 0,
                             width: 0,
                             height: 60)
        
        popupView.addSubview(loginRegisterSegmentedControl)
        loginRegisterSegmentedControl.setAnchor(top: titleLabel.bottomAnchor,
                                                leading: popupView.leadingAnchor,
                                                bottom: nil,
                                                trailing: popupView.trailingAnchor,
                                                paddingTop: 8,
                                                paddingLeft: 10,
                                                paddingBottom: 0,
                                                paddingRight: 10,
                                                width: 0,
                                                height: 30)

        popupView.addSubview(cancelButton)
        cancelButton.setAnchor(top: nil,
                               leading: popupView.leadingAnchor,
                               bottom: popupView.bottomAnchor,
                               trailing: nil,
                               paddingTop: 0,
                               paddingLeft: 8,
                               paddingBottom: 8,
                               paddingRight: 0,
                               width: 108,
                               height: 30)
        
        popupView.addSubview(loginRegisterButton)
        loginRegisterButton.setAnchor(top: nil,
                                      leading: nil,
                                      bottom: popupView.bottomAnchor,
                                      trailing: popupView.trailingAnchor,
                                      paddingTop: 0,
                                      paddingLeft: 0,
                                      paddingBottom: 8,
                                      paddingRight: 8,
                                      width: 108,
                                      height: 30)
        
        let textFieldsStackView = UIStackView(arrangedSubviews: [nameTF, emailTF, passwordTF, confirmPasswordTF])
        textFieldsStackView.distribution = .fillProportionally
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 8
        popupView.addSubview(textFieldsStackView)
        textFieldsStackView.setAnchor(top: loginRegisterSegmentedControl.bottomAnchor,
                                      leading: popupView.leadingAnchor,
                                      bottom: cancelButton.topAnchor,
                                      trailing: popupView.trailingAnchor,
                                      paddingTop: 8,
                                      paddingLeft: 8,
                                      paddingBottom: 8,
                                      paddingRight: 8)
    }
    
    @objc func changeWebView() {
        if (loginRegisterSegmentedControl.selectedSegmentIndex == 0) {
            loginRegisterButton.setTitle("Log in", for: .normal)
            registerHeightConstraint.isActive = false
            loginHeightConstraint.isActive = true
            
            nameTF.isHidden = true
            confirmPasswordTF.isHidden = true
            
            print("login")
        } else {
            print("register")
            loginRegisterButton.setTitle("Sign up", for: .normal)
            loginHeightConstraint.isActive = false
            registerHeightConstraint.isActive = true
            
            nameTF.isHidden = false
            confirmPasswordTF.isHidden = false
        }
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc fileprivate func handleCancel() {
        UIView.animate(withDuration: 0.4, animations: {
            self.blurView.effect = nil
            self.popupView.alpha = 0
            self.popupView.transform = CGAffineTransform.init(scaleX: Device.IS_IPHONE ? 2 : 4, y: Device.IS_IPHONE ? 2 : 4)
        }) { _ in
            self.cancelAction?()
        }
    }
    
    @objc fileprivate func handleSubmit() {
        print("handleSubmit")
        submitAction?()
    }
    
    // MARK: - Public actions
    func animate() {
        UIView.animate(withDuration: 0.4) {
            self.blurView.effect = UIBlurEffect(style: .light)
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
            
        }
    }
    
    func handleKeyboardUp() {
        self.yCenterAnchor.isActive = false
        self.yUpAnchor.isActive = true
        UIView.animate(withDuration: 0.4) {
            self.layoutIfNeeded()
        }
    }
    
    func handleKeyboardDown() {
        self.yUpAnchor.isActive = false
        self.yCenterAnchor.isActive = true
        UIView.animate(withDuration: 0.4) {
            self.layoutIfNeeded()
        }
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
