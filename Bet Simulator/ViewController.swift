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
    var randomSmall = [Int] ()
    var randomBig = [Int] ()
    var randomRed = [Int] ()
    var randomBlack = [Int] ()
    var randomEven = [Int] ()
    var randomOdd = [Int] ()
    var queueSmall = [Int] ()
    var queueBig = [Int] ()
    var queueRed = [Int] ()
    var queueBlack = [Int] ()
    var queueEven = [Int] ()
    var queueOdd = [Int] ()
    var number = 0
    var indicator = 1;
    var winningMoneySmall = 0
    var winningMoneyBig = 0
    var highestBettingSmall = 0
    var highestBettingBig = 0
    var lowestMoneySmall = 0
    var lowestMoneyBig = 0
    var moneySmall = 0
    var moneyBig = 0
    var winningMoneyRed = 0
    var winningMoneyBlack = 0
    var highestBettingRed = 0
    var highestBettingBlack = 0
    var lowestMoneyRed = 0
    var lowestMoneyBlack = 0
    var moneyRed = 0
    var moneyBlack = 0
    var winningMoneyOdd = 0
    var winningMoneyEven = 0
    var highestBettingOdd = 0
    var highestBettingEven = 0
    var lowestMoneyOdd = 0
    var lowestMoneyEven = 0
    var moneyEven = 0
    var moneyOdd = 0
    var startValueNumber = 5
    var totalSmall = 0
    var totalBig = 0
    var totalRed = 0
    var totalBlack = 0
    var totalEven = 0
    var totalOdd = 0
    var totalZero = 0
    var counter = 0
    var money = 0
    var highestNum = 0
    var winningMoney = 0
    var lowestMoney = 0
    var totalGame = 0
    var numberEntered = 0
    
    @IBAction func numberTapped(_ sender: AnyObject) {
        (numberDisplay.text!, isTypingNumber) = Controller().getNumber(number: (sender.currentTitle)!!, isTypingNumber: isTypingNumber, numberDisplay: numberDisplay.text!)
    }
    @IBAction func numberClear(_ sender: AnyObject) {
        isTypingNumber = false
        numberDisplay.text = "0"
    }
    @IBAction func numberEntered(_ sender: AnyObject) {
        
    }
    @IBOutlet weak var numberDisplay: UILabel!
    @IBOutlet weak var prevNumberDisplay: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var startValueDisplay: UILabel!
    @IBAction func startValue(_ sender: UIStepper) {
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
                randomSmall.removeAll()
                randomBig.removeAll()
                randomRed.removeAll()
                randomBlack.removeAll()
                randomEven.removeAll()
                randomOdd.removeAll()
                queueSmall.removeAll()
                queueBig.removeAll()
                queueRed.removeAll()
                queueBlack.removeAll()
                queueEven.removeAll()
                queueOdd.removeAll()
            case 1:
                start = 1
                Controller().initializeCurrent(aText: defaultSmallWinText.text!, bText: defaultBigWinText.text!, aMinCapitalText: defaultSmallMinCapitalText.text!, bMinCapitalText: defaultBigMinCapitalText.text!, aWin: smallWin.text!, bWin: bigWin.text!, aMinCapital: smallMinCapital.text!, bMinCapital: bigMinCapital.text!, currentText: defaultCurrentSmallBigText.text!, nextBet: nextSmallBigBet.text!, currentWinText: currentSmallBigWinText.text!, currentWin: currentSmallBigWin.text!, queueA: queueSmall, queueB: queueBig, startValueNumber: startValueNumber, moneyA: moneySmall, moneyB: moneyBig, winningMoneyA: winningMoneySmall, winningMoneyB: winningMoneyBig, lowestMoneyA: lowestMoneySmall, lowestMoneyB: lowestMoneyBig, randomA: randomSmall, randomB: randomBig)
                Controller().initializeCurrent(aText: defaultRedWinText.text!, bText: defaultBlackWinText.text!, aMinCapitalText: defaultRedMinCapitalText.text!, bMinCapitalText: defaultBlackMinCapitalText.text!, aWin: redWin.text!, bWin: blackWin.text!, aMinCapital: redMinCapital.text!, bMinCapital: blackMinCapital.text!, currentText: defaultCurrentRedBlackText.text!, nextBet: nextRedBlackBet.text!, currentWinText: currentRedBlackWinText.text!, currentWin: currentRedBlackWin.text!, queueA: queueRed, queueB: queueBlack, startValueNumber: startValueNumber, moneyA: moneyRed, moneyB: moneyBlack, winningMoneyA: winningMoneyRed, winningMoneyB: winningMoneyBlack, lowestMoneyA: lowestMoneyRed, lowestMoneyB: lowestMoneyBlack, randomA: randomRed, randomB: randomBlack)
                Controller().initializeCurrent(aText: defaultEvenWinText.text!, bText: defaultOddWinText.text!, aMinCapitalText: defaultEvenMinCapitalText.text!, bMinCapitalText: defaultOddMinCapitalText.text!, aWin: evenWin.text!, bWin: oddWin.text!, aMinCapital: evenMinCapital.text!, bMinCapital: oddMinCapital.text!, currentText: defaultCurrentEvenOddText.text!, nextBet: nextEvenOddBet.text!, currentWinText: currentEvenOddWinText.text!, currentWin: currentEvenOddWin.text!, queueA: queueEven, queueB: queueOdd, startValueNumber: startValueNumber, moneyA: moneyEven, moneyB: moneyOdd, winningMoneyA: winningMoneyEven, winningMoneyB: winningMoneyOdd, lowestMoneyA: lowestMoneyEven, lowestMoneyB: lowestMoneyOdd, randomA: randomEven, randomB: randomOdd)
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

