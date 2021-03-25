//
//  GoalStore.swift
//  ScreenSnooze
//
//  Created by Zoe Beals on 3/9/21.
//

import UIKit

class GoalStore {
    var allGoals = [Goals]()
    
    @discardableResult func createGoal() -> Goals {
        let newGoal = Goals(random: true)
        
        allGoals.append(newGoal)
        return newGoal
    }
    
    func removeGoal(_ goal: Goals) {
        if let index = allGoals.firstIndex(of: goal) {
            allGoals.remove(at: index)
        }
    }
}
