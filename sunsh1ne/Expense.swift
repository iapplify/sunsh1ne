//
//  Expense.swift
//  sunsh1ne
//
//  Created by Taylor Jackson on 2015-07-05.
//  Copyright (c) 2015 iApplify. All rights reserved.
//

import Foundation

public class Expense {
    
    var expenseParticipants: [String: Double]
    var netFlowOfCash: [String: Double]
    
    
    init(participants: [String: Double]) {
        self.expenseParticipants = participants;
        self.netFlowOfCash = [String: Double]()
    }
    
    
    func getTotalExpenseCost() -> Double {
        var totalExpense: Double = 0.0
        for(person, expense) in expenseParticipants {
            totalExpense += expense
        }
        
        return totalExpense;
    }
    
    
    func calculateNetFlow() -> [String: Double] {
        for (person, personalExpense) in self.expenseParticipants {
            netFlowOfCash[person] = (self.getTotalExpenseCost() / Double(expenseParticipants.count)) - personalExpense
        }
        
        return netFlowOfCash
    }
}