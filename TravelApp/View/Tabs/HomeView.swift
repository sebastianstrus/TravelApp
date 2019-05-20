//
//  HomeView.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-19.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.barTintColor = UIColor.mainBlue
        bar.isTranslucent = false
        return bar
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.mainBlue
        button.setTitle("Search", for: .normal)
        button.layer.borderWidth = 0.2
        return button
    }()
    
    
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        
        addSubview(searchButton)
        searchButton.setAnchor(top: safeTopAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 48)
        
        addSubview(searchBar)
        searchBar.setAnchor(top: safeTopAnchor, leading: leadingAnchor, bottom: nil, trailing: searchButton.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -1, width: 0, height: 48)
        
        addSubview(tableView)
        tableView.setAnchor(top: searchButton.bottomAnchor, leading: leadingAnchor, bottom: safeBottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
