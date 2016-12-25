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
    }
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

