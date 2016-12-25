//
//  Controller.swift
//  Bet Simulator
//
//  Created by Nicholas Tan on 25/12/2016.
//  Copyright © 2016 Nicholas Tan. All rights reserved.
//

import Foundation

class Controller {
    func initializeCurrent(aText: String, bText: String, aMinCapitalText: String, bMinCapitalText: String, aWin: String, bWin: String, aMinCapital: String, bMinCapital: String, currentText: String, nextBet: String, currentWinText: String, currentWin: String, queueA: [Int], queueB: [Int], startValueNumber: Int, moneyA: Int, moneyB: Int, winningMoneyA: Int, winningMoneyB: Int, lowestMoneyA: Int, lowestMoneyB: Int, randomA: [Int], randomB: [Int]) ->  (String, String, String, String, String, String, String, String, String, String, String, String, Int, Int, Int, Int, Int, Int) {
        var aText = aText
        var bText = bText
        var aMinCapitalText = aMinCapitalText
        var bMinCapitalText = bMinCapitalText
        var aWin = aWin
        var bWin = bWin
        var aMinCapital = aMinCapital
        var bMinCapital = bMinCapital
        var currentText = currentText
        var nextBet = nextBet
        var currentWinText = currentWinText
        var currentWin = currentWin
        var queueA = queueA
        var moneyA = moneyA
        var winningMoneyA = winningMoneyA
        var lowestMoneyA = lowestMoneyA
        var queueB = queueB
        var moneyB = moneyB
        var winningMoneyB = winningMoneyB
        var lowestMoneyB = lowestMoneyB
        var randomA = randomA
        var randomB = randomB
        
        aText = ""
        bText = ""
        aMinCapitalText = ""
        bMinCapitalText = ""
        aWin = ""
        bWin = ""
        aMinCapital = ""
        bMinCapital = ""
        currentText = "Draw           Bet: "
        nextBet = "0"
        currentWinText = "Win: "
        currentWin = "0"
        queueA.removeAll()
        queueB.removeAll()
        randomA.removeAll()
        randomB.removeAll()
        
        for _ in 0..<3
        {
            queueA.append(startValueNumber)
            queueB.append(startValueNumber)
        }
        moneyA = startValueNumber + startValueNumber
        moneyB = startValueNumber + startValueNumber
        winningMoneyA = 0
        winningMoneyB = 0
        lowestMoneyA = 0
        lowestMoneyB = 0
        return (aText, bText, aMinCapitalText, bMinCapitalText, aWin, bWin, aMinCapital, bMinCapital, currentText, nextBet, currentWinText, currentWin, moneyA, moneyB, winningMoneyA, winningMoneyB, lowestMoneyA, lowestMoneyB)
    }
    
    func getNumber(number : String, isTypingNumber : Bool, numberDisplay : String) -> (String, Bool) {
        var numberDisplay = numberDisplay
        var isTypingNumber = isTypingNumber
        if isTypingNumber
        {
            numberDisplay = numberDisplay + number
        }
        else
        {
            numberDisplay = number
            isTypingNumber = true
        }
        return (numberDisplay, isTypingNumber)
    }
}
