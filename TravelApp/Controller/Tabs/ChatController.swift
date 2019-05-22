//
//  FifthController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class ChatController: UIViewController {

    private var chatView: ChatView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        view.backgroundColor = UIColor.white
        
        setupNavigationBar()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        let chatView = ChatView()
        self.chatView = chatView
        view.addSubview(chatView)
        chatView.pinToEdges(view: view)
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    fileprivate func setupNavigationBar() {

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Chat"
        
    }
}
