//
//  Goals.swift
//  ScreenSnooze
//
//  Created by Zoe Beals on 3/9/21.
//

import UIKit

class Goals : Equatable {
    var goalName: String
    var isCompleted: Bool
    var description: String?
    var startDate: Date?
    var endDate: Date?
    
    static func ==(lhs: Goals, rhs: Goals) -> Bool {
        return lhs.goalName == rhs.goalName
            && lhs.isCompleted == rhs.isCompleted
            && lhs.description == rhs.description
            && lhs.startDate == rhs.startDate
            && lhs.endDate == rhs.endDate
    }
    init(goalName: String, description: String?, startDate: Date?, endDate: Date?) {
        self.goalName = goalName
        self.startDate = startDate
        self.endDate = endDate
        self.description = description
        isCompleted = false
    }
    
    convenience init(random: Bool = false) {
        if random {
            let titles = ["Finish Homework", "Work on Homework", "Listen to Music", "Talk to Family", "Play with Dogs"]
            let randomTitle = titles.randomElement()!
            
            self.init(goalName: randomTitle, description: nil, startDate: nil, endDate: nil)
        } else {
            self.init(goalName: "", description: nil, startDate: nil, endDate: nil)
        }
    }
}
