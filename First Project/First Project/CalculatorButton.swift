//
//  CalculatorButton.swift
//  First Project
//
//  Created by LibUser on 11/22/23.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText: String = "1"
    var size: CGFloat = 80
    var color: Color = Color(hue: 1.0, saturation: 0.038, brightness: 0.223)
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button(action: {
            action(self)
        },
          label: {
                Text(buttonText)
                    .font(.largeTitle)
                    .frame(width: size, height: size, alignment: .center)
                    .background(color)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
        })
    }
    
    
    
}
struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
