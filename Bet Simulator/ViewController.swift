//
//  ViewController.swift
//  Bet Simulator
//
//  Created by Nicholas Tan on 25/12/2016.
//  Copyright © 2016 Nicholas Tan. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var isTypingNumber = false
    var start = Int()
    var small = Queue()
    var big = Queue()
    var red = Queue()
    var black = Queue()
    var even = Queue()
    var odd = Queue()
    
    var indicator = 1
    var startValueNumber = 5
    var counter = 0
    var totalGame = 0
    var totalSmall = 0
    var totalBig = 0
    var totalRed = 0
    var totalBlack = 0
    var totalEven = 0
    var totalOdd = 0
    var totalZero = 0
    
    var random = [Int] ()
    var queue = [Int] ()
    var money = 0
    var winningMoney = 0

    
    @IBAction func numberTapped(_ sender: AnyObject) {
        let number = sender.currentTitle
        
        if isTypingNumber
        {
            numberDisplay.text = numberDisplay.text! + number!!
        }
        else
        {
            numberDisplay.text = number!
            isTypingNumber = true
        }
    }
    @IBAction func numberClear(_ sender: AnyObject) {
        isTypingNumber = false
        numberDisplay.text = "0"
    }
    @IBAction func numberEntered(_ sender: AnyObject) {
        isTypingNumber = false
        
        let totalGame = Int(numberDisplay.text!)!
        
        if start == 0
        {
            small.removeAllRandom()
            big.removeAllRandom()
            
            for i in 0..<totalGame
            {
                small.addRandom(newElement: Int(arc4random_uniform(37)))
                print(small.getRandom())
                big.addRandom(newElement: small.getRandom()[i])
                print(big.getRandom())
                if small.getRandom()[i] == 0
                {
                    totalZero += 1
                }
                else if small.getRandom()[i] > 0 && small.getRandom()[i] < 19
                {
                    totalSmall += 1
                }
                else if small.getRandom()[i] > 18 && small.getRandom()[i] < 37
                {
                    totalBig += 1
                }
                
                if small.getRandom()[i] == 1 || small.getRandom()[i] == 3 || small.getRandom()[i] == 5 || small.getRandom()[i] == 7 || small.getRandom()[i] == 9 || small.getRandom()[i] == 12 || small.getRandom()[i] == 14 || small.getRandom()[i] == 16 || small.getRandom()[i] == 18 || small.getRandom()[i] == 19 || small.getRandom()[i] == 21 || small.getRandom()[i] == 23 || small.getRandom()[i] == 25 || small.getRandom()[i] == 27 || small.getRandom()[i] == 30 || small.getRandom()[i] == 32 || small.getRandom()[i] == 34 || small.getRandom()[i] == 36
                {
                    totalRed += 1
                }
                else if small.getRandom()[i] == 2 || small.getRandom()[i] == 4 || small.getRandom()[i] == 6 || small.getRandom()[i] == 8 || small.getRandom()[i] == 10 || small.getRandom()[i] == 11 || small.getRandom()[i] == 13 || small.getRandom()[i] == 15 || small.getRandom()[i] == 17 || small.getRandom()[i] == 20 || small.getRandom()[i] == 22 || small.getRandom()[i] == 24 || small.getRandom()[i] == 26 || small.getRandom()[i] == 28 || small.getRandom()[i] == 29 || small.getRandom()[i] == 31 || small.getRandom()[i] == 33 || small.getRandom()[i] == 35
                {
                    totalBlack += 1
                }
                
                if small.getRandom()[i] % 2 == 0 && small.getRandom()[i] != 0
                {
                    totalEven += 1
                }
                else if small.getRandom()[i] % 2 == 1 && small.getRandom()[i] != 0
                {
                    totalOdd += 1
                }
                print("Print")
                print(totalZero)
                print(totalSmall)
                print(totalBig)
                print(totalRed)
                print(totalBlack)
                print(totalEven)
                print(totalOdd)
            }
            
            for indicator in 1..<4
            {
                for i in 0..<2
                {
                    small.removeAllQueue()
                    
                    for _ in 0..<3
                    {
                        small.addQueue(newElement: startValueNumber)
                    }
                    
                    counter = 0;
                    small.resetWithoutAppend(startValueNumber: startValueNumber)
                    
                    while counter != totalGame
                    {
                        (random, queue, money, winningMoney) = Logic().check(random: small.getRandom(), queue: small.getQueue(), side: i, money: small.getMoney(), winMoney: small.getWinningMoney(), startValueNumber: startValueNumber, indicator: indicator)
                        small.setRandom(random: random)
                        small.setQueue(queue: queue)
                        small.setMoney(money: money)
                        small.setWinningMoney(winningMoney: winningMoney)
                        small.setLowestMoney(lowestMoney: Logic().minCapital(lowestMoney: small.getLowestMoney(), winMoney: small.getWinningMoney()))
                        counter += 1
                    }
                    
                    if i == 0
                    {
                        if indicator == 1
                        {
                            smallWin.text = String(small.getWinningMoney())
                            if small.getLowestMoney() > 0
                            {
                                smallMinCapital.text = "0"
                            }
                            else
                            {
                                smallMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                        else if indicator == 2
                        {
                            redWin.text = String(small.getWinningMoney())
                            if small.getLowestMoney() > 0
                            {
                                redMinCapital.text = "0"
                            }
                            else
                            {
                                redMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                        else
                        {
                            evenWin.text = String(winningMoney)
                            if small.getLowestMoney() > 0
                            {
                                evenMinCapital.text = "0"
                            }
                            else
                            {
                                evenMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                    }
                    else
                    {
                        if indicator == 1
                        {
                            bigWin.text = String(winningMoney)
                            if small.getLowestMoney() > 0
                            {
                                bigMinCapital.text = "0"
                            }
                            else
                            {
                                bigMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                        else if indicator == 2
                        {
                            blackWin.text = String(winningMoney)
                            if small.getLowestMoney() > 0
                            {
                                blackMinCapital.text = "0"
                            }
                            else
                            {
                                blackMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                        else
                        {
                            oddWin.text = String(winningMoney)
                            if small.getLowestMoney() > 0
                            {
                                oddMinCapital.text = "0"
                            }
                            else
                            {
                                oddMinCapital.text = String(small.getLowestMoney() * -1)
                            }
                        }
                    }
                    
                    for j in 0..<totalGame
                    {
                        small.addRandom(newElement: big.getRandom()[j])
                    }
                }
            }
//        else if start == 1
//        {
//            prevNumberDisplay.text = String(numberEntered)
//            
//            numberEntered = Int(numberDisplay.text!)!
//            randomSmall.append(numberEntered)
//            randomBig.append(numberEntered)
//            randomRed.append(numberEntered)
//            randomBlack.append(numberEntered)
//            randomEven.append(numberEntered)
//            randomOdd.append(numberEntered)
//            
//            (randomSmall, queueSmall, moneySmall, winningMoneySmall) = check(randomC: randomSmall, queueC: queueSmall, sideC: 0, moneyC: moneySmall, winMoneyC: winningMoneySmall, startValueNumberC: startValueNumber, indicatorC: 1)
//            lowestMoneySmall = minCapital(lowestMoney: lowestMoneySmall, winMoney: winningMoneySmall)
//            
//            (randomBig, queueBig, moneyBig, winningMoneyBig) = check(randomC: randomBig, queueC: queueBig, sideC: 1, moneyC: moneyBig, winMoneyC: winningMoneyBig, startValueNumberC: startValueNumber, indicatorC: 1)
//            lowestMoneyBig = minCapital(lowestMoney: lowestMoneyBig, winMoney: winningMoneyBig)
//            
//            (randomRed, queueRed, moneyRed, winningMoneyRed) = check(randomC: randomRed, queueC: queueRed, sideC: 0, moneyC: moneyRed, winMoneyC: winningMoneyRed, startValueNumberC: startValueNumber, indicatorC: 2)
//            lowestMoneyRed = minCapital(lowestMoney: lowestMoneyRed, winMoney: winningMoneyRed)
//            
//            (randomBlack, queueBlack, moneyBlack, winningMoneyBlack) = check(randomC: randomBlack, queueC: queueBlack, sideC: 1, moneyC: moneyBlack, winMoneyC: winningMoneyBlack, startValueNumberC: startValueNumber, indicatorC: 2)
//            lowestMoneyBlack = minCapital(lowestMoney: lowestMoneyBlack, winMoney: winningMoneyBlack)
//            
//            (randomEven, queueEven, moneyEven, winningMoneyEven) = check(randomC: randomEven, queueC: queueEven, sideC: 0, moneyC: moneyEven, winMoneyC: winningMoneyEven, startValueNumberC: startValueNumber, indicatorC: 3)
//            lowestMoneyEven = minCapital(lowestMoney: lowestMoneyEven, winMoney: winningMoneyEven)
//            
//            (randomOdd, queueOdd, moneyOdd, winningMoneyOdd) = check(randomC: randomOdd, queueC: queueOdd, sideC: 1, moneyC: moneyOdd, winMoneyC: winningMoneyOdd, startValueNumberC: startValueNumber, indicatorC: 3)
//            lowestMoneyOdd = minCapital(lowestMoney: lowestMoneyOdd, winMoney: winningMoneyOdd)
//            
//            if moneySmall == moneyBig
//            {
//                defaultCurrentSmallBigText.text = "Draw           Bet: "
//                nextSmallBigBet.text = "0"
//            }
//            else if moneySmall < moneyBig
//            {
//                defaultCurrentSmallBigText.text = "Big            Bet: "
//                nextSmallBigBet.text = String(moneyBig - moneySmall)
//            }
//            else
//            {
//                defaultCurrentSmallBigText.text = "Small          Bet: "
//                nextSmallBigBet.text = String(moneySmall - moneyBig)
//            }
//            currentSmallBigWin.text = String(winningMoneyBig+winningMoneySmall)
//            
//            if moneyRed == moneyBlack
//            {
//                defaultCurrentRedBlackText.text = "Draw           Bet: "
//                nextRedBlackBet.text = "0"
//            }
//            else if moneyRed < moneyBlack
//            {
//                defaultCurrentRedBlackText.text = "Black          Bet: "
//                nextRedBlackBet.text = String(moneyBlack - moneyRed)
//            }
//            else
//            {
//                defaultCurrentRedBlackText.text = "Red            Bet: "
//                nextRedBlackBet.text = String(moneyRed - moneyBlack)
//            }
//            currentRedBlackWin.text = String(winningMoneyBlack+winningMoneyRed)
//            
//            if moneyEven == moneyOdd
//            {
//                defaultCurrentEvenOddText.text = "Draw           Bet: "
//                nextEvenOddBet.text = "0"
//            }
//            else if moneyEven < moneyOdd
//            {
//                defaultCurrentEvenOddText.text = "Odd            Bet: "
//                nextEvenOddBet.text = String(moneyOdd - moneyEven)
//            }
//            else
//            {
//                defaultCurrentEvenOddText.text = "Even           Bet: "
//                nextEvenOddBet.text = String(moneyEven - moneyOdd)
//            }
//            currentEvenOddWin.text = String(winningMoneyOdd+winningMoneyEven)
        }
    }
    @IBOutlet weak var numberDisplay: UILabel!
    @IBOutlet weak var prevNumberDisplay: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var startValueDisplay: UILabel!
    @IBAction func startValue(_ sender: UIStepper) {
        startValueDisplay.text = Int(sender.value).description
        startValueNumber = Int(Int(sender.value).description)!
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func indexChange(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
            case 0:
                defaultSmallWinText.text = "Small          Win: "
                defaultBigWinText.text = "Big              Win: "
                defaultSmallMinCapitalText.text = "MinCapital: "
                defaultBigMinCapitalText.text = "MinCapital: "
                smallWin.text = "0"
                bigWin.text = "0"
                smallMinCapital.text = "0"
                bigMinCapital.text = "0"
                defaultCurrentSmallBigText.text = ""
                nextSmallBigBet.text = ""
                currentSmallBigWinText.text = ""
                currentSmallBigWin.text = ""
                defaultRedWinText.text = "Red             Win: "
                defaultBlackWinText.text = "Black          Win: "
                defaultRedMinCapitalText.text = "MinCapital: "
                defaultBlackMinCapitalText.text = "MinCapital: "
                redWin.text = "0"
                blackWin.text = "0"
                redMinCapital.text = "0"
                blackMinCapital.text = "0"
                defaultCurrentRedBlackText.text = ""
                nextRedBlackBet.text = ""
                currentRedBlackWinText.text = ""
                currentRedBlackWin.text = ""
                defaultEvenWinText.text = "Even           Win: "
                defaultOddWinText.text = "Odd            Win: "
                defaultEvenMinCapitalText.text = "MinCapital: "
                defaultOddMinCapitalText.text = "MinCapital: "
                evenWin.text = "0"
                oddWin.text = "0"
                evenMinCapital.text = "0"
                oddMinCapital.text = "0"
                defaultCurrentEvenOddText.text = ""
                nextEvenOddBet.text = ""
                currentEvenOddWinText.text = ""
                currentEvenOddWin.text = ""
                start = 0
                small.removeAll()
                big.removeAll()
                red.removeAll()
                black.removeAll()
                even.removeAll()
                odd.removeAll()
            case 1:
                defaultSmallWinText.text = ""
                defaultBigWinText.text = ""
                defaultSmallMinCapitalText.text = ""
                defaultBigMinCapitalText.text = ""
                smallWin.text = ""
                bigWin.text = ""
                smallMinCapital.text = ""
                bigMinCapital.text = ""
                defaultCurrentSmallBigText.text = "Draw           Bet: "
                nextSmallBigBet.text = "0"
                currentSmallBigWinText.text = "Win: "
                currentSmallBigWin.text = "0"
                defaultRedWinText.text = ""
                defaultBlackWinText.text = ""
                defaultRedMinCapitalText.text = ""
                defaultBlackMinCapitalText.text = ""
                redWin.text = ""
                blackWin.text = ""
                redMinCapital.text = ""
                blackMinCapital.text = ""
                defaultCurrentRedBlackText.text = "Draw           Bet: "
                nextRedBlackBet.text = "0"
                currentRedBlackWinText.text = "Win: "
                currentRedBlackWin.text = "0"
                defaultEvenWinText.text = ""
                defaultOddWinText.text = ""
                defaultEvenMinCapitalText.text = ""
                defaultOddMinCapitalText.text = ""
                evenWin.text = ""
                oddWin.text = ""
                evenMinCapital.text = ""
                oddMinCapital.text = ""
                defaultCurrentEvenOddText.text = "Draw           Bet: "
                nextEvenOddBet.text = "0"
                currentEvenOddWinText.text = "Win: "
                currentEvenOddWin.text = "0"
                start = 1
                small.reset(startValueNumber: startValueNumber)
                big.reset(startValueNumber: startValueNumber)
                red.reset(startValueNumber: startValueNumber)
                black.reset(startValueNumber: startValueNumber)
                even.reset(startValueNumber: startValueNumber)
                odd.reset(startValueNumber: startValueNumber)
        default: break
        }
    }
    @IBOutlet weak var defaultSmallWinText: UILabel!
    @IBOutlet weak var defaultCurrentSmallBigText: UILabel!
    @IBOutlet weak var defaultBigWinText: UILabel!
    @IBOutlet weak var defaultRedWinText: UILabel!
    @IBOutlet weak var defaultCurrentRedBlackText: UILabel!
    @IBOutlet weak var defaultBlackWinText: UILabel!
    @IBOutlet weak var defaultEvenWinText: UILabel!
    @IBOutlet weak var defaultCurrentEvenOddText: UILabel!
    @IBOutlet weak var defaultOddWinText: UILabel!
    @IBOutlet weak var smallWin: UILabel!
    @IBOutlet weak var nextSmallBigBet: UILabel!
    @IBOutlet weak var bigWin: UILabel!
    @IBOutlet weak var redWin: UILabel!
    @IBOutlet weak var nextRedBlackBet: UILabel!
    @IBOutlet weak var blackWin: UILabel!
    @IBOutlet weak var evenWin: UILabel!
    @IBOutlet weak var nextEvenOddBet: UILabel!
    @IBOutlet weak var oddWin: UILabel!
    @IBOutlet weak var defaultSmallMinCapitalText: UILabel!
    @IBOutlet weak var currentSmallBigWinText: UILabel!
    @IBOutlet weak var defaultBigMinCapitalText: UILabel!
    @IBOutlet weak var defaultRedMinCapitalText: UILabel!
    @IBOutlet weak var currentRedBlackWinText: UILabel!
    @IBOutlet weak var defaultBlackMinCapitalText: UILabel!
    @IBOutlet weak var defaultEvenMinCapitalText: UILabel!
    @IBOutlet weak var currentEvenOddWinText: UILabel!
    @IBOutlet weak var defaultOddMinCapitalText: UILabel!
    @IBOutlet weak var smallMinCapital: UILabel!
    @IBOutlet weak var currentSmallBigWin: UILabel!
    @IBOutlet weak var bigMinCapital: UILabel!
    @IBOutlet weak var redMinCapital: UILabel!
    @IBOutlet weak var currentRedBlackWin: UILabel!
    @IBOutlet weak var blackMinCapital: UILabel!
    @IBOutlet weak var evenMinCapital: UILabel!
    @IBOutlet weak var currentEvenOddWin: UILabel!
    @IBOutlet weak var oddMinCapital: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 5
        stepper.stepValue = 5
        stepper.maximumValue = 100
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

