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

