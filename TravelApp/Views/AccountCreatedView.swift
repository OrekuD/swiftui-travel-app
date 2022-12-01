//
//  AccountCreatedView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 01/12/2022.
//

import SwiftUI

struct AccountCreatedView: View {
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
            VStack {
                Image("congrats_illustration")
                
                Text("Congrats!")
                    .bold()
                    .font(.largeTitle)
                    .padding(.vertical, 12)
                
                Text("Account Created\nSuccessfully")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.bottom, 54)
                
                Button {
                    print("hh")
                } label: {
                    ButtonLabel(isDisabled: false, label: "Get Started")
                }
                .frame(width: 200)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)

            }
            .padding(.horizontal, 24)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct AccountCreatedView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreatedView()
    }
}
