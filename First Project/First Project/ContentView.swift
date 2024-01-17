//
//  ContentView.swift
//  First Project
//
//  Created by Todd Perkins on 9/22/21.
//

import SwiftUI

enum CalculatorMode{
    case notSet
    case addition
    case subtraction
    case multiplication
    case division
}

struct ContentView: View {
    
    @State var currentValue = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    
    var body: some View {
        
        ZStack{
            Color(.black)
            VStack{
                TotalText(value: currentValue)
                HStack{
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .green, action: didPressMode, mode: .addition)
                }
                HStack{
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .green, action: didPressMode, mode: .subtraction)
                }
                HStack{
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "*", color: .green, action: didPressMode, mode: .multiplication)
                }
                HStack{
                    CalculatorButton(buttonText: "0", color: .blue , action: didPressNumber)
                    CalculatorButton(buttonText: "C", color: .orange, action: didPressClears)
                    CalculatorButton(buttonText: "=", color: .orange, action: didPressEquals)
                    
                    CalculatorButton(buttonText: "/", color: .green, action: didPressMode, mode: .division)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText) {
            currentValueInt = parsedValue
            updateText()
        }
        else {
            currentValue = "ERROR"
            currentValueInt = 0
        }
        
    }
    
    func didPressMode(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
        print(currentMode)
    }
    
    func didPressClears(button: CalculatorButton) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedNum = 0
        currentValueInt = 0
    }
    
    func didPressEquals(button: CalculatorButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedNum += currentValueInt
        }
        else if currentMode == .subtraction {
            savedNum -= currentValueInt
        }
        else if currentMode == .multiplication {
            savedNum *= currentValueInt
        }
        else {
            if currentValueInt != 0 {
                savedNum /= currentValueInt
            }
            else {
                currentValue = "ERROR" //........................................
                
            }
        }
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormater.string(from: num) ?? "ERROR"
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
