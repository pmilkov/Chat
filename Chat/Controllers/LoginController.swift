//
//  LoginController.swift
//  Chat
//
//  Created by Dubious Duck on 4/25/19.
//  Copyright © 2019 ChatApplication. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class LoginController: UIViewController {
    static var user = User()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let UsernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 83, g: 145, b: 255)
        button.setTitle("Set Name", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        return button
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 64, g: 135, b: 245)
        
        view.addSubview(inputsContainerView)
        view.addSubview(UsernameButton)
        

        let defaults = UserDefaults.standard
        
        if  let id = defaults.string(forKey: "jsq_id"),
            let name = defaults.string(forKey: "jsq_name")
        {
            LoginController.user.id = id
            LoginController.user.name = name
        }
        else
        {
            LoginController.user.id = String(arc4random_uniform(999999))
            LoginController.user.name = ""
            
            defaults.set(LoginController.user.id, forKey: "jsq_id")
            defaults.synchronize()
        }
        
        setupInputsContainerView()
        setupUsernameButton()
    }
    
    
    @objc func handleLogIn() {
        LoginController.user.name = nameTextField.text
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeperatorView)
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1).isActive = true
        
        
    }
    
    func setupUsernameButton() {
        UsernameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UsernameButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        UsernameButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        UsernameButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}


extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: g/255, alpha: 1)
    }
    
}
