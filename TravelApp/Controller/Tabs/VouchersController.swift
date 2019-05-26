//
//  ThirdController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class VouchersController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private var vouchersView: VouchersView!
    private let cellId = "cellId"
    
    fileprivate var vouchers: [VoucherTemp]  = [] {
        didSet {
            vouchersView.toggleInfoLabel(isEmpty: vouchers.isEmpty)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        setupNavigationBar()
        setupView()
        
        let screenWidth = Device.SCREEN_WIDTH
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        print("screenWidth: \(screenWidth)")
        // 343
        let side = (screenWidth - 32)/3
        print("side: \(side)")
        layout.itemSize = CGSize(width: screenWidth/3-50, height: screenWidth/3-50)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        vouchersView.collectionView.collectionViewLayout = layout
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        CanvasObjectController.shared.fetchCanvasObjects()
//        canvases =  CanvasObjectController.shared.canvases
        vouchers = TempData.getVouchers()
        //vouchers = []
        
        self.vouchersView.reload(isEmpty: vouchers.isEmpty)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vouchers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

        cell.backgroundColor = UIColor.darkGray
        cell.layer.borderWidth = 0.5
        
        let side = CGFloat(Device.SCREEN_WIDTH) / 3
        cell.frame.size.width = side //CGFloat(Device.SCREEN_WIDTH - 32) / 3)
        cell.frame.size.height = side //CGFloat(Device.SCREEN_WIDTH / 3 - 5)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        print("Device.SCREEN_WIDTH: \(Device.SCREEN_WIDTH)")
        let side: Int = (Device.SCREEN_WIDTH - 32) / 3
        return CGSize(width: 118, height: 118)
    }*/
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//    }
    
    // MARK: - Private methods
    fileprivate func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Vouchers"
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addItem
    }
    
    @objc private func addTapped() {
        print("addTapped")
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
