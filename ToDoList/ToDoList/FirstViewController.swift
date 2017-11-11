//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Jose Melendez on 11/11/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variables
    var taskList = [String]()
    
    //MARK: - IB-Outlets
    
    //tableView Reference
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life Cycle
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    //viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
        //Must call super when overriding viewDidAppear
        super.viewDidAppear(true)

        getUserDefaults()
        
    }
    
    //MARK: Table View Functions
    
    //numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    //cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = taskList[indexPath.row]
        
        return cell
    }
    
    //Delete rows
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
          taskList.remove(at: indexPath.row)
            
          tableView.reloadData()
            
         UserDefaults.standard.set(taskList, forKey: "tasks")
            
        }
        
    }
    
    


    //MARK: - Custom functions
    
    //Get UserDefaults data
    func getUserDefaults() {
        
        //Get the tasks array from the UserDefaults
        let taskObject = UserDefaults.standard.object(forKey: "tasks")
        
        //Safely unwrap the taskObject
        if let tasks = taskObject as? [String] {
            
            taskList = tasks
        
        }
        
        //Reload the tableView data
        tableView.reloadData()
    }


}
