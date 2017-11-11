//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Jose Melendez on 11/11/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables
    
    //tasks
    var tasks = [String]()
    
    //MARK: - IB-Outlets
    
    //TextField Reference
    @IBOutlet weak var enterTaskTextfield: UITextField!
    
    //MARK: - Life Cycle
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IB-Actions
    
    //Add Button Tapped
    @IBAction func addButtonTapped(_ sender: UIButton) {
    
        //Get the data from UserDefaults
        let taskObject = UserDefaults.standard.object(forKey: "tasks")
        
        if let taskItems = taskObject as? [String] {
            
            tasks = taskItems
            
            //Add what the user entered to the tasks array
            tasks.append(enterTaskTextfield.text!)
         
            
        } else {
            
            //If data can't be retrieved set tasks = to what the user entered
            tasks = [enterTaskTextfield.text!]
        }
        
        //Store tasks in UserDefaults
        UserDefaults.standard.set(tasks, forKey: "tasks")
        
        enterTaskTextfield.text = ""
    }
    
    //MARK: - Delegate Functions
    
    //Dismiss the keyboard when user touches the View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //Dismiss keyboard when user taps enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

