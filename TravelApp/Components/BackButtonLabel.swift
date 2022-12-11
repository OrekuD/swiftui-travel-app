//
//  BackButtonLabel.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 30/11/2022.
//

import SwiftUI

struct BackButtonLabel: View {
    var body: some View {
        VStack {
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .bold()
                .foregroundColor(.primary)
        }
        .frame(width: 42, height: 42)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

struct BackButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonLabel()
    }
}
