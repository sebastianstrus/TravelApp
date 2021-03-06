//
//  HomeController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate {
    
    
    private var searchController: UISearchController!
    private var postTableView: UITableView!
    private let cellId = "PostCellId"
    private var allPosts: [Post]  = []
    private var searchedPosts = [Post]()
    private var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        
        allPosts = TempData.getPosts()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBar()
    }
    
    // MARK: - UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (searching ? searchedPosts : allPosts).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeTableViewCell
        
        let post = (searching ? searchedPosts : allPosts)[indexPath.row]
        cell.setup(imageName: post.imageName!,
                   date: post.date!,
                   numberCandidates: post.numberOfCandidates!,
                   title: post.title!)
        return cell
     }
    
    // MARK: - UITableViewDelegate methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - UISearchBarDelegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedPosts = allPosts.filter({$0.title!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        postTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        postTableView.reloadData()
    }
    
    // MARK: - Private methods
    fileprivate func setupNavigationBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        definesPresentationContext = true
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

        navigationItem.searchController?.searchBar.delegate = self
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Trips"
        
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
        createPostController.title = "New Trip"
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
        postTableView = UITableView()
        view.addSubview(postTableView)
        postTableView.pinToSafeEdges(view: view)
        postTableView.delegate = self
        postTableView.dataSource = self
        //postTableView.allowsSelection = true
        postTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    

}
