//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    var task = Task.allTasks
    var inProgressData = Task.inProgressData
    var notStartedData = Task.notStartedData
    var completedData = Task.completedData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        taskTableView.dataSource = self
    }
    
    
    
    
    
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        task.count
        switch section {
        case 0:
            
            return notStartedData.count
        case 1:
            return  inProgressData.count
        case 2:
            return  completedData.count
        default:
            
            return -1
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let data = task[indexPath.row]
        
        guard let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell") else {
            return UITableViewCell()
            
            
        }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = notStartedData[indexPath.row].name
            cell.detailTextLabel?.text = notStartedData[indexPath.row].dueDate.description
            
        case 1:
            cell.textLabel?.text = inProgressData[indexPath.row].name
            cell.detailTextLabel?.text = inProgressData[indexPath.row].dueDate.description
            
        case 2:
            cell.textLabel?.text = completedData[indexPath.row].name
            cell.detailTextLabel?.text = completedData[indexPath.row].dueDate.description
            
        default:
            
            return UITableViewCell()
            
            //        cell.textLabel?.text = data.name
            //        cell.detailTextLabel?.text = data.dueDate.description
            //        return cell
            
        }
        return  cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "notStarted"
        case 1:
            return "inProgress"
        case 2:
            return "completed"
        default:
            
            return ""
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
}

