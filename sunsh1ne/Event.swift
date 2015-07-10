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