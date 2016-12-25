//
//  Controller.swift
//  Bet Simulator
//
//  Created by Nicholas Tan on 25/12/2016.
//  Copyright © 2016 Nicholas Tan. All rights reserved.
//

import Foundation

class Controller {
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
