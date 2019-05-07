//
//  ClassesController.swift
//  Chat
//
//  Created by Dubious Duck on 4/25/19.
//  Copyright © 2019 ChatApplication. All rights reserved.
//

import UIKit
import Firebase

class ClassesController: UITableViewController {
    
    let cellId = "cellId"
    var classes = [Class]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if LoginController.user.id == nil {
            let loginController = LoginController()
            present(loginController, animated: true, completion: nil)
        }
        
//        let defaults = UserDefaults.standard
//
//        if  let id = defaults.string(forKey: "jsq_id"),
//            let name = defaults.string(forKey: "jsq_name")
//        {
//            senderId = id
//            senderDisplayName = name
//        }
//        else
//        {
//            senderId = String(arc4random_uniform(999999))
//            senderDisplayName = ""
//
//            defaults.set(senderId, forKey: "jsq_id")
//            defaults.synchronize()
//
//        }
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Change Name", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Class", style: .plain, target: self, action: #selector(handleAddClass))
        
        fetchPersonalClasses()
        
    }
    
    func fetchPersonalClasses() {
        Database.database().reference().child("PersonalClasses").child(LoginController.user.id ?? "test").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let class_ = Class()
                class_.setValuesForKeys(dictionary)
                self.classes.append(class_)

                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
            }
            
        }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let _class = classes[indexPath.row]
        cell.textLabel?.text = _class.name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _class = self.classes[indexPath.row]
        if _class.name == "CSCI270-M01" {
            let ChatController = CSCI270M01Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "CSCI270-M02" {
            let ChatController = CSCI270M02Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "CSCI318-M01" {
            let ChatController = CSCI318M01Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "CSCI318-M02" {
            let ChatController = CSCI318M02Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "ICPH305-M01" {
            let ChatController = ICPH305M01Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "ICPH305-M02" {
            let ChatController = ICPH305M02Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "IENG400-M01" {
            let ChatController = IENG400M01Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
        if _class.name == "IENG400-M02" {
            let ChatController = IENG400M02Controller()
            navigationController?.pushViewController(ChatController, animated: true)
        }
    }
    

    
    @objc func handleLogout() {
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    @objc func handleAddClass() {

//        let addClassController = AddClassController()
//        present(addClassController, animated: true, completion: nil)
        
//        let navController = UINavigationController(rootViewController: addClassController)
//        self.present(navController, animated: true, completion: nil)
        
//        let addClassController = Chat2ViewController()
//        navigationController?.pushViewController(addClassController, animated: true)
        
        let addClassController = AddClassController()
        let navController = UINavigationController(rootViewController: addClassController)
        self.present(navController, animated: true, completion: nil)

    }
    
    

}
