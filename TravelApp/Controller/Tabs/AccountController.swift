//
//  SecondController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-18.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit
import Firebase
import KVNProgress

class AccountController: UIViewController, UIImagePickerControllerDelegate, UIPickerViewDelegate, UINavigationControllerDelegate {

    private var accountView: AccountView!
    
    var isLoggedIn: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        setupNavigationBar()
        setupView()
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isLoggedIn = Auth.auth().currentUser?.uid != nil
        print("AccountController isLoggedIn: \(String(describing: isLoggedIn))")
        
        if isLoggedIn {
            updateUserDetails()
        }
    }
    
    private func setupView() {
        //there is 3 containers in the view
        let mainView = AccountView(frame: self.view.frame)
        accountView = mainView
        
        //assign actions
        accountView.cameraAction = cameraPressed
        accountView.libraryAction = libraryPressed
        accountView.logoutAction = logoutPressed
        accountView.removeAccountAction = removeAccountPressed
        
        self.view.addSubview(accountView)
        self.accountView.pinToEdges(view: view)
    }
    
    // MARK: - Buttons Actions
    private func cameraPressed() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func libraryPressed() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func logoutPressed() {
        let alert = UIAlertController(title: "Logout from \(AppKeys.APP_TITLE)".localized, message: "Are you sure you want to logout?".localized, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Logout".localized, style: .default, handler: { (UIAlertAction) in
            self.handleLogout()
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: Device.IS_IPAD ? .default : .cancel, handler: nil))
        
        // support for iPAD:
        if Device.IS_IPAD {
            alert.popoverPresentationController?.sourceView = self.accountView
            alert.popoverPresentationController?.sourceRect = CGRect(x: view.center.x, y: view.center.y, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        self.present(alert, animated: true)
    }
    
    private func removeAccountPressed() {
        let alert = UIAlertController(title: "Remove account from \(AppKeys.APP_TITLE)", message: "Are you sure you want to remove your account permanently?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Remove".localized, style: .destructive, handler: { (UIAlertAction) in
            self.handleRemoveAccount()
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: Device.IS_IPAD ? .default : .cancel, handler: nil))
        
        // support for iPAD:
        if Device.IS_IPAD {
            alert.popoverPresentationController?.sourceView = self.accountView
            alert.popoverPresentationController?.sourceRect = CGRect(x: view.center.x, y: view.center.y, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        
        self.present(alert, animated: true)
        
    }
    
    // MARK: - UIImagePickerControllerDelegate functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            accountView.profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
    
    // MARK: - Helpers
    private func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        print("LOGOUT")
//        let welcomeController = WelcomeController()
//        present(welcomeController, animated: true)
    }
    
    private func handleRemoveAccount() {
        let user = Auth.auth().currentUser
        let userRef = Database.database().reference().child("users").child(user!.uid)
        user?.delete { error in
            if let error = error {
                print(error)
                KVNProgress.showError(withStatus: "Error \nRemoving account requires recent authentication")
            } else {
                userRef.removeValue()
                print("REMOVE ACCOUNT")
//                let welcomeController = WelcomeController()
//                self.present(welcomeController, animated: true)
            }
        }
    }
    
    // set details for current user
    func updateUserDetails() {
        let currentUser = Auth.auth().currentUser
        let uid = currentUser?.uid
        let ref = Database.database().reference()
        ref.child("users").child(uid!).observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
            
            if let dict = snapshot.value as? [String: AnyObject] {
                let username = dict["name"] as! String
                let email = dict["email"] as! String
                let imageUrl = dict["profileImageUrl"] as! String
                let meals = dict["meals"]
                
                self.accountView.numberOfMealsLabel.text = "Saved meals: ".localized + "\(meals?.count ?? 0)"
                self.accountView.profileImageView.load(urlString: imageUrl)
                self.accountView.userNameLabel.text = "Username: ".localized + username
                self.accountView.emailLabel.text = "Email: ".localized + email
            }
        }
        let creationDate = currentUser?.metadata.creationDate?.formatedString()
        
        accountView.registrationDateLabel.text = "Registration date: ".localized + creationDate!
    }
    

    

    fileprivate func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "Account"
    }
}
