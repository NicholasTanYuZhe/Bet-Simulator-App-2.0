//
//  Queue.swift
//  Bet Simulator
//
//  Created by Nicholas Tan on 25/12/2016.
//  Copyright © 2016 Nicholas Tan. All rights reserved.
//

import Foundation

class Queue {
    var queue = [Int] ()
    var money = 0
    var winningMoney = 0
    var lowestMoney = 0
    
    func getQueue() -> [Int] {
        return queue
    }
    func getMoney() -> Int {
        return money
    }
    func getWinningMoney() -> Int {
        return winningMoney
    }
    func getLowestMoney() -> Int {
        return lowestMoney
    }
    func addQueue(newElement: Int) -> Void {
        queue.append(newElement)
    }
    func removeQueue(pos: Int) -> Void {
        queue.remove(at: pos)
    }
    func removeAllQueue() -> Void {
        queue.removeAll()
    }
    func setMoney(money: Int) -> Void {
        self.money = money
    }
    func setWinningMoney(winningMoney: Int) -> Void {
        self.winningMoney = winningMoney
    }
    func setLowestMoney(lowestMoney: Int) -> Void {
        self.lowestMoney = lowestMoney
    }
}
