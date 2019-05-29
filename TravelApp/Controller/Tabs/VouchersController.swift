//
//  ThirdController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit
import Firebase

class VouchersController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private var vouchersView: VouchersView!
    private let cellId = "cellId"
    
    fileprivate var vouchers: [VoucherTemp]  = [] {
        didSet {
            vouchersView.toggleInfoLabel(isEmpty: vouchers.isEmpty)
        }
    }
    
    var isLoggedIn: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavigationBar()
//        CanvasObjectController.shared.fetchCanvasObjects()
//        canvases =  CanvasObjectController.shared.canvases
        vouchers = TempData.getVouchers()
        //vouchers = []
        
        self.vouchersView.reload(isEmpty: vouchers.isEmpty)
        
    }
    

    // MARK: - UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vouchers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.setCellShadow()
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width - 40
        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
    
    // MARK: - Private methods
    fileprivate func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Vouchers"
        
        setupButton()
    }
    
    func setupButton() {
        let loginItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItem.Style.plain, target: self, action: #selector(loginTapped))
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        if (Auth.auth().currentUser?.uid != nil) {
            self.navigationItem.rightBarButtonItem = addItem
        } else {
            self.navigationItem.rightBarButtonItem = loginItem
        }
    }
    

    
    @objc private func addTapped() {
        let createPostController = CreatePostController()
        createPostController.title = "New Voucher"
        createPostController.view.backgroundColor = UIColor.lightGray
        self.navigationController?.pushViewController(createPostController, animated: true)
    }
    
    @objc private func loginTapped() {
        let authController = AuthController()
        
        // tell parent controller that you are logged in when you close the child controller
        authController.didLoggedIn = { () in
            self.setupButton()
        }
        
        authController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        present(authController, animated: false)
    }

    private func setupView() {
        vouchersView = VouchersView()
        view.addSubview(vouchersView)
        vouchersView.pinToSafeEdges(view: view)
        
        vouchersView.setDelegate(d: self)
        vouchersView.setDataSource(ds: self)
        vouchersView.registerCell(className: UICollectionViewCell.self, id: cellId)
    }
}

