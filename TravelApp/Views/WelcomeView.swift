//
//  WelcomeView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                Image("banana_shape_top").resizable().scaledToFit()
                Spacer()
                Text("Welcome")
                    .bold()
                    .font(.largeTitle)
                    .rotationEffect(.degrees(-19.22))
                HStack {
                    Spacer()
                    Image("banana_shape_bottom")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                }
            }
            
            VStack {
                Spacer()
                NavigationLink(destination: OnboardingView()) {
                        VStack {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color("green"))
                                .frame(width: 24, height: 24)
                                .bold()
                        }
                        .frame(width: 84, height: 84)
                        .background(colorScheme == .dark ? Color(.secondarySystemBackground) : Color(.systemBackground) )
                        .cornerRadius(84)
                        .shadow(color: .primary.opacity(Double(0.1)), radius: 30, x: 4, y: 16)
                    }.frame(maxWidth: .infinity, alignment: .trailing)
            }.padding(.bottom, 70).padding(.horizontal, 34)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
