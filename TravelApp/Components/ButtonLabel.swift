//
//  ButtonLabel.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct ButtonLabel: View {
    var isDisabled: Bool = false;
    var label: String = "";
    
    var body: some View {
        Text(label)
            .bold()
            .font(.title3)
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .frame(height: 57)
            .frame(maxWidth: .infinity)
            .background(isDisabled ? Color("darkgrey") : Color("green"))
            .cornerRadius(15)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(isDisabled: false, label: "")
            .padding(.horizontal, 24)
            .frame(height: 200).background(.gray)
    }
}
