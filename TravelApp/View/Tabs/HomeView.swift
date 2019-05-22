//
//  HomeView.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-19.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    var searchAction: (() -> Void)?
    
    var shownHeightConstraint: NSLayoutConstraint!
    var hiddenHeightConstraint: NSLayoutConstraint!
    var barIsHidden: Bool = true
    
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.barTintColor = UIColor.mainBlue
        bar.isTranslucent = false
        // workaround to remove the border
        bar.backgroundImage = UIImage()
        return bar
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.mainBlue
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(handleSearch), for: UIControl.Event.touchUpInside)
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
        hiddenHeightConstraint = searchButton.heightAnchor.constraint(equalToConstant: 0)
        hiddenHeightConstraint.isActive = true
        
        
        addSubview(containerView)
        containerView.setAnchor(top: safeTopAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        hiddenHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 0)
        hiddenHeightConstraint.isActive = true
        
        shownHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 48)
        shownHeightConstraint.isActive = false
        
        
        
        containerView.addSubview(searchButton)
        searchButton.setAnchor(top: containerView.topAnchor, leading: nil, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 0)

        containerView.addSubview(searchBar)
        searchBar.setAnchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: searchButton.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        addSubview(tableView)
        tableView.setAnchor(top: containerView.bottomAnchor, leading: leadingAnchor, bottom: safeBottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    
    func toggleBar() {
        if (barIsHidden) {
            hiddenHeightConstraint.isActive = false
            shownHeightConstraint.isActive = true
            barIsHidden = !barIsHidden
        } else {
            hiddenHeightConstraint.isActive = true
            shownHeightConstraint.isActive = false
            barIsHidden = !barIsHidden
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func handleSearch() {
        searchAction?()
    }
    
    // public methods
    func getWord() -> String? {
        return searchBar.text
    }
}
