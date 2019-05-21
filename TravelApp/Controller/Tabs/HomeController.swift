//
//  HomeController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var homeView: HomeView!
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
        let homeView = HomeView()
        self.homeView = homeView
        self.homeView.searchAction = handleSearch
        view.addSubview(homeView)
        homeView.pinToEdges(view: view)
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.allowsSelection = true
        homeView.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: cellId)
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
     
        cell.pictureImageView.image = UIImage(named:postsToShow[indexPath.row].imageName!)
        cell.candidatesLabel.text = "\(postsToShow[indexPath.row].numberOfCandidates!)"
        cell.titleLabel.text = postsToShow[indexPath.row].title
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
     
     return cell
     }
    
    // MARK: - UITableViewDelegate functions
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - Private functions
    fileprivate func setupNavigationBar() {

        let firstItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let secondItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addTapped))

        self.navigationItem.rightBarButtonItems = [firstItem, secondItem]
        
        
        
        
        
        
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Trips"
        
    }
    
    @objc func addTapped() {
        print("Plus pressed")
        homeView.toggleBar()
    }
    
    //TODO: simplify: let filtered = numbers.filter({ return $0 == 3 })
    @objc func handleSearch() {
        postsToShow.removeAll()
        guard let word = homeView.getWord(), !word.isEmpty else { return }

        for post in allPosts {
            if post.title?.lowercased().contains((word).lowercased()) == true {
                postsToShow.append(post)
            }
        }
        animateTable()
    }
    
    func animateTable() {
        homeView.tableView.reloadData()
        let cells = homeView.tableView.visibleCells
        let tableViewHeight = homeView.tableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
