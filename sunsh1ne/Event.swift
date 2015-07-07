//
//  Event.swift
//  sunsh1ne
//
//  Created by Taylor Jackson on 2015-07-06.
//  Copyright (c) 2015 iApplify. All rights reserved.
//

import Foundation

public class Event {
    
    var expenses: [Expense] {
        get {
            return self.expenses
        }
        
        set {
            self.expenses = newValue
        }
    }
    
    
    var participants: [String] {
        get {
            return self.participants
        }
        
        set {
            self.participants = newValue
        }
    }
    
    
    init() {
        self.participants = [String]()
        self.expenses = [Expense]()
    }
    
    
    func addParticipant(personName: String) {
        self.participants.append(personName)
    }
    
    
    func removeParticipant(personName: String) {
        self.participants.filter( {$0 != personName} )
    }
    
    
    func addExpense(expense: Expense) {
        self.expenses.append(expense)
    }
}