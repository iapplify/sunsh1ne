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