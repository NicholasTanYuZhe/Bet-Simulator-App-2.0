//
//  Logic.swift
//  Bet Simulator
//
//  Created by Nicholas Tan on 25/12/2016.
//  Copyright © 2016 Nicholas Tan. All rights reserved.
//

import Foundation

class Logic {
    func check(random: [Int], queue: [Int], side: Int, money: Int, winMoney: Int, startValueNumber: Int, indicator: Int) -> ([Int], [Int], Int, Int)
    {
        var money = money
        var queue = queue
        var winMoney = winMoney
        var random = random
        let indicator = indicator
        let startValueNumber = startValueNumber
        let side = side
        let currentNum = random[0]
        random.removeFirst()
        
        //Ignore 0
        if indicator == 1 {
            //Big Small, 0 = small, 1 = big
            if currentNum > 0 && currentNum < 19 {
                if side == 1 {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
            }
            else if currentNum > 18 && currentNum < 37 {
                if side == 1 {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
            }
        }
        else if indicator == 2 {
            //Red Black, 0 = red, 1 = black
            if currentNum == 1 || currentNum == 3 || currentNum == 5 || currentNum == 7 || currentNum == 9 || currentNum == 12 || currentNum == 14 || currentNum == 16 || currentNum == 18 || currentNum == 19 || currentNum == 21 || currentNum == 23 || currentNum == 25 || currentNum == 27 || currentNum == 30 || currentNum == 32 || currentNum == 34 || currentNum == 36 {
                if side == 1 {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
            }
            else if currentNum == 2 || currentNum == 4 || currentNum == 6 || currentNum == 8 || currentNum == 10 || currentNum == 11 || currentNum == 13 || currentNum == 15 || currentNum == 17 || currentNum == 20 || currentNum == 22 || currentNum == 24 || currentNum == 26 || currentNum == 28 || currentNum == 29 || currentNum == 31 || currentNum == 33 || currentNum == 35 {
                if side == 1 {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
            }
        }
        else if indicator == 3
        {
            //Odd Even, 0 = even, 1 = odd
            let number = currentNum % 2;
            if number == 0 && currentNum != 0 {
                if side == 1 {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
            }
            else if number == 1 && currentNum != 0 {
                if side == 1 {
                    (queue, money, winMoney) = win(queueW: queue, moneyW: money, winMoneyW: winMoney, startValueNumberW: startValueNumber)
                }
                else {
                    (queue, money, winMoney) = lose(queueL: queue, moneyL: money, winMoneyL: winMoney, startValueNumberL: startValueNumber)
                }
            }
        }
        return (random, queue, money, winMoney)
    }
    
    func win(queueW: [Int], moneyW: Int, winMoneyW: Int, startValueNumberW: Int) -> ([Int], Int, Int)
    {
        var money = moneyW
        var queue = queueW
        var winMoney = winMoneyW
        let startValueNumber = startValueNumberW
        
        if queue.count != 1
        {
            queue.removeFirst()
            queue.removeLast()
            winMoney = winMoney + money
        }
        else
        {
            queue.removeFirst()
            winMoney = winMoney + money
        }
        
        if queue.count == 0
        {
            for _ in 0..<3
            {
                queue.append(startValueNumber)
            }
            money = startValueNumber * 2
        }
        else if queue.count != 1
        {
            money = queue[0] + queue[queue.count-1]
        }
        else
        {
            money = queue[0]
        }
        
        return (queue, money, winMoney)
    }
    
    func lose(queueL: [Int], moneyL: Int, winMoneyL: Int, startValueNumberL: Int) -> ([Int], Int, Int)
    {
        var money = moneyL
        var queue = queueL
        var winMoney = winMoneyL
        //let startValueNumber = startValueNumberL
        
        //if money > (startValueNumber * 10)
        //{
        //for _ in 0..<2
        //{
        //queue.append(startValueNumber)
        //}
        //money = startValueNumber
        //}
        queue.append(money)
        winMoney = winMoney - money
        money = queue[0] + queue[queue.count-1]
        
        return (queue, money, winMoney)
    }
    
    func minCapital(lowestMoney: Int, winMoney: Int) -> Int
    {
        var lowestMoney = lowestMoney
        if winMoney < lowestMoney
        {
            lowestMoney = winMoney
        }
        return lowestMoney
    }

}
