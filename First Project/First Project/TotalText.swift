//
//  TotalText.swift
//  First Project
//
//  Created by LibUser on 11/22/23.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 100))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.white)
            .lineLimit(1)
    }
}
//
//#Preview {
//    TotalText()
//        
//}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
          
    }
}
