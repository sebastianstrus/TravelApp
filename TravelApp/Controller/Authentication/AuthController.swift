//
//  WelcomeController.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-17.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit
import Firebase
import KVNProgress

class AuthController: UIViewController {
    
    var authView: AuthView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        handleKeyboard()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        authView.animate()
        
        
        //navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Private functions
    private func handleKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification: Notification) {
        authView.handleKeyboardUp()
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        authView.handleKeyboardDown()
    }
    
    func setupView() {
        //playVideo(title: "foody_background")
        let mainView = AuthView(frame: self.view.frame)
        authView = mainView
        authView.cancelAction = handleCancel
        authView.submitAction = handleSubmit
        self.view.addSubview(authView)
        
        authView.pinToEdges(view: view)
    }
    
    fileprivate func handleCancel() {
        dismiss(animated: false)
    }
    
    // MARK: - Events
    func handleSubmit() {
        authView.isLogin() ? handleLogin() : handleRegister()
    }
    
    func handleLogin() {
        
        //validateForm()
        
        guard let email = authView.emailTF.text, email.isValidEmail(), let password = authView.passwordTF.text, authView.passwordTF.text != "" else {
            print("Wrong user data")
            return
        }
        print("email: \(email)")
        print("password: \(password)")
        
        KVNProgress.show(withStatus: "Loading...")
        Auth.auth().signIn(withEmail: email, password: password) { (loginResult, error) in
            if error != nil {
                print(error!)
                KVNProgress.showError(withStatus: "Wrong email or password.")
                return
            }
            
            KVNProgress.dismiss()
            self.dismiss(animated: false)
//            let tabBarVC = TabBarController()
//            self.present(tabBarVC, animated: true, completion: nil)
        }
    }
    
    fileprivate func handleRegister() {
        //validateForm()
        
        guard let name = authView.nameTF.text, authView.nameTF.text != "" else { return }
        guard let email = authView.emailTF.text, email.isValidEmail() else { return }
        guard let password = authView.passwordTF.text, authView.passwordTF.text != "" else { return }
        guard authView.confirmPasswordTF.text != "" else { return }
        
        KVNProgress.show(withStatus: "Creating account...")
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                KVNProgress.showError(withStatus: "Couldn't create account.", on: nil)
                print(error!)
                return
            }
            guard let uid = authResult?.user.uid else { return }
            
            //successfully authenticated user
            
            
            
            // without saving image:
            let values = ["name": name, "email": email]
            self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
            
            
            
            
            
            
            //let imageName = NSUUID().uuidString
            /*
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
            if let uploadData = self.authView.profileImageView.image!.jpegData(compressionQuality: 0.5) {
                storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    storageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                        }
                        if let profileImageUrl = url?.absoluteString {
                            let values = ["name": name, "email": email, "profileImageUrl": profileImageUrl]
                            self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
                        }
                    })
                }
            }*/
        }
    }
    
    
    // MARK: - Helpers
    private func registerUserIntoDatabaseWithUID(uid: String, values: [String: AnyObject]) {
        let ref = Database.database().reference(fromURL: AppURLs.TRAVELTUBE_DB)
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                KVNProgress.dismiss()
                print("Couldn't save child values")
                print(err!)
                return
            }
            print("User saved successfully into Firebase")
            self.resetForm()
            KVNProgress.dismiss()
            self.dismiss(animated: false)
//            let tabBarVC = TabBarController()
//            self.present(tabBarVC, animated: true, completion: nil)
        })
    }
    
    private func resetForm() {
        authView.nameTF.text = ""
        authView.emailTF.text = ""
        authView.passwordTF.text = ""
        authView.confirmPasswordTF.text = ""
    }
    
    
    

}
