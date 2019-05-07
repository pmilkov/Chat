//
//  AddClassController.swift
//  Chat
//
//  Created by Dubious Duck on 4/25/19.
//  Copyright © 2019 ChatApplication. All rights reserved.
//

import UIKit
import Firebase

class AddClassController: UITableViewController {
    
    let cellId = "cellId"
    var classes = [Class]()
    static var personalClasses = [PersonalClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Class"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchClasses()
        fetchPersonalClasses()
    }
    
    func fetchClasses() {
        Database.database().reference().child("classes").observe(.childAdded, with: { (snapshot) in
            
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
    
    func fetchPersonalClasses() {
        Database.database().reference().child("PersonalClasses").child(LoginController.user.id ?? "test").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let personalClass = PersonalClass()
                personalClass.setValuesForKeys(dictionary)
                AddClassController.personalClasses.append(personalClass)
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
        let ref = Database.database().reference().child("PersonalClasses").child(LoginController.user.id ?? "test")
        let childRef = ref.childByAutoId()
        let name = ["name": _class.name]
        
        
        fetchPersonalClasses()
        
        var checkRepeat = false
        for n in 0..<AddClassController.personalClasses.count {
            if _class.name == AddClassController.personalClasses[n].name{
                checkRepeat = true
                break
            }
        }
        
        if checkRepeat == false {
            AddClassController.personalClasses.removeAll(keepingCapacity: false)
            childRef.updateChildValues(name)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
