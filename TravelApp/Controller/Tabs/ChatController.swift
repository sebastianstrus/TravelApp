//
//  FifthController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit
import Firebase

class ChatController: UIViewController {

    private var chatView: ChatView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        view.backgroundColor = UIColor.white
        

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Chat"
        
        let loginItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItem.Style.plain, target: self, action: #selector(loginTapped))
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        if (Auth.auth().currentUser?.uid != nil) {
            self.navigationItem.rightBarButtonItem = addItem
        } else {
            self.navigationItem.rightBarButtonItem = loginItem
        }
    }
    
    @objc private func addTapped() {
        let createPostController = CreateVoucherController()
        createPostController.title = "New Voucher"
        createPostController.view.backgroundColor = UIColor.lightGray
        self.navigationController?.pushViewController(createPostController, animated: true)
    }
    
    @objc private func loginTapped() {
        let authController = AuthController()
        authController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        present(authController, animated: false)
    }
    
    private func setupView() {
        let chatView = ChatView()
        self.chatView = chatView
        view.addSubview(chatView)
        chatView.pinToSafeEdges(view: view)
    }
}
