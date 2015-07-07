//
//  sunsh1neTests.swift
//  sunsh1neTests
//
//  Created by Taylor Jackson on 2015-07-05.
//  Copyright (c) 2015 iApplify. All rights reserved.
//

import UIKit
import XCTest

class sunsh1neTests: XCTestCase {
    
    let expenseAccuracy = 0.001
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetTotalExpenseCostOnePerson() {
        let expense = Expense(participants: ["Taylor": 1])
        XCTAssert(expense.getTotalExpenseCost() == 1, "Pass")
    }
    
    func testGetTotalExpenseCostTwoPeople() {
        let expense = Expense(participants: ["Taylor": 1, "Scott": 1])
        XCTAssert(expense.getTotalExpenseCost() == 2, "Pass")
    }
    
    func testGetTotalExpenseCostThreePeopleScenario1() {
        let expense = Expense(participants: ["Taylor": 1, "Scott": 1, "Hugh": 1])
        XCTAssert(expense.getTotalExpenseCost() == 3, "Pass")
    }
    
    func testGetTotalExpenseCostThreePeopleScenario2() {
        let expense = Expense(participants: ["Taylor": 1, "Scott": 1.50, "Hugh": 1])
        XCTAssert(expense.getTotalExpenseCost() == 3.5, "Pass")
    }
    
    func testGetTotalExpenseCostThreePeopleScenario3() {
        let expense = Expense(participants: ["Taylor": 1.75, "Scott": 1.50, "Hugh": 1.33])
        XCTAssert(expense.getTotalExpenseCost() == 4.58, "Pass")
    }
    
    func testCalculateNetFlowScenario1() {
        let expense = Expense(participants: ["Taylor": 100, "Scott": 50, "Hugh": 0])
        var netFlow = expense.calculateNetFlow()
        
        XCTAssert(netFlow["Taylor"] == -50, "Pass")
        XCTAssert(netFlow["Scott"] == 0, "Pass")
        XCTAssert(netFlow["Hugh"] == 50, "Pass")
    }
    
    func testCalculateNetFlowScenario2() {
        let expense = Expense(participants: ["Taylor": 2131.12, "Scott": 959.36, "Hugh": 1098.99])
        var netFlow = expense.calculateNetFlow()
        
        XCTAssertEqualWithAccuracy(netFlow["Taylor"]!, -734.63, expenseAccuracy, "Pass")
        XCTAssertEqualWithAccuracy(netFlow["Scott"]!, 437.13, expenseAccuracy, "Pass")
        XCTAssertEqualWithAccuracy(netFlow["Hugh"]!, 297.5, expenseAccuracy, "Pass")
    }
    
    func testCalculateNetFlowScenario3() {
        let expense = Expense(participants: ["Taylor": 50, "Scott": 50, "Hugh": 50])
        var netFlow = expense.calculateNetFlow()
        
        XCTAssert(netFlow["Taylor"] == 0, "Pass")
        XCTAssert(netFlow["Scott"] == 0, "Pass")
        XCTAssert(netFlow["Hugh"] == 0, "Pass")
    }
    
    func testCalculateNetFlowScenario4() {
        let expense = Expense(participants: ["Taylor": 50, "Scott": 0])
        var netFlow = expense.calculateNetFlow()
        
        XCTAssert(netFlow["Taylor"] == -25, "Pass")
        XCTAssert(netFlow["Scott"] == 25, "Pass")
    }
}
