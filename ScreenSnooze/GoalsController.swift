//
//  GoalsController.swift
//  ScreenSnooze
//
//  Created by Zoe Beals on 3/9/21.
//

import UIKit

class GoalsController: UITableViewController {
    var goalStore : GoalStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func addNewGoal(_ sender: UIButton) {
        let newGoal = goalStore.createGoal()
        if let index = goalStore.allGoals.firstIndex(of: newGoal) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalStore.allGoals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalCell
        let goal = goalStore.allGoals[indexPath.row]
        cell.goalNameLabel?.text = goal.goalName
        cell.descriptionLabl?.text = goal.description
        cell.isCompletedLabel.text = "\(goal.isCompleted)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let goal = goalStore.allGoals[indexPath.row]
            goalStore.removeGoal(goal)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
