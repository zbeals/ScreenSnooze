//
//  DetailViewController.swift
//  ScreenSnooze
//
//  Created by Zoe Beals on 3/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var goalNameField: UITextField!
    @IBOutlet var isCompletedField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    @IBOutlet var endField: UITextField!
    @IBOutlet var startField: UITextField!
    
    var goal: Goals!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goalNameField.text = "\(goal.goalName)"
        isCompletedField.text = "\(goal.isCompleted)"
        descriptionField.text = goal.description
        endField.text = dateFormatter.string(from: goal.endDate!)
        startField.text = dateFormatter.string(from: goal.startDate!)
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
