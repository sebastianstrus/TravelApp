//
//  WelcomeController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-17.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class AuthController: UIViewController {
    
    var authView: AuthView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        handleKeyboard()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        authView.animate()
        
        
        //navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Private functions
    private func handleKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification: Notification) {
        authView.handleKeyboardUp()
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        authView.handleKeyboardDown()
    }
    
    func setupView() {
        //playVideo(title: "foody_background")
        let mainView = AuthView(frame: self.view.frame)
        authView = mainView
        authView.cancelAction = handleCancel
        self.view.addSubview(authView)
        
        authView.pinToEdges(view: view)
    }
    
    fileprivate func handleCancel() {
        dismiss(animated: false)
    }
    

}
