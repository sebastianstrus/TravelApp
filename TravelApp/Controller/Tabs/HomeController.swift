//
//  HomeController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate {
    
    private var homeView: UITableView!
    private let cellId = "PostCellId"
    
    private var allPosts: [Post]  = []
    
    private var postsToShow: [Post] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        setupNavigationBar()
        
        allPosts = TempData.getPosts()
        
        postsToShow = allPosts
        //let a = Post(title: <#T##String#>, imageName: <#T##String#>)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupView()
    }
    
    private func setupView() {

        homeView = UITableView()
        view.addSubview(homeView)
        homeView.pinToEdges(view: view)
        homeView.delegate = self
        homeView.dataSource = self
        homeView.allowsSelection = true
        homeView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeTableViewCell
     
        let post = postsToShow[indexPath.row]
        cell.setup(imageName: post.imageName!,
                   numberCandidates: post.numberOfCandidates!,
                   title: post.title!)
     return cell
     }
    
    // MARK: - UITableViewDelegate functions
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    // MARK: - Private functions
    fileprivate func setupNavigationBar() {

        let searchController = UISearchController(searchResultsController: nil)

        searchController.delegate = self
        
        let searchBar = searchController.searchBar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //textfield.textColor = UIColor.mainBlue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
        
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.barTintColor = UIColor.mainBlue
        }
        navigationItem.searchController = searchController


        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addItem
        
        
        // title
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Trips"
        
    }
    
    @objc func addTapped() {
        print("Plus pressed")
        //homeView.toggleBar()
    }
    
    //TODO: simplify: let filtered = numbers.filter({ return $0 == 3 })
//    @objc func handleSearch() {
//        postsToShow.removeAll()
//        guard let word = homeView.getWord(), !word.isEmpty else { return }
//
//        for post in allPosts {
//            if post.title?.lowercased().contains((word).lowercased()) == true {
//                postsToShow.append(post)
//            }
//        }
//        animateTable()
//    }
//
//    func animateTable() {
//        homeView.tableView.reloadData()
//        let cells = homeView.tableView.visibleCells
//        let tableViewHeight = homeView.tableView.bounds.size.height
//        for cell in cells {
//            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
//        }
//        var delayCounter = 0
//
//        for cell in cells {
//            UIView.animate(withDuration: 1.3, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//                cell.transform = CGAffineTransform.identity
//            }, completion: nil)
//            delayCounter += 1
//        }
//    }
}
