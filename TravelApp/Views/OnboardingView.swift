//
//  OnboardingView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct OnboardingItem: Hashable {
    var imageName: String;
    var title: String;
    var description: String;
    var tag: Int;
}

struct OnboardingView: View {
    @State var activeSlide: Int = 0;
    var slides: [OnboardingItem] = [
        OnboardingItem(
            imageName: "onboarding_slide_1",
            title: "Explore Destinations",
            description: "Discover the places for your trip in the world and feel great.",
            tag: 0
        ),
        OnboardingItem(
            imageName: "onboarding_slide_2",
            title: "Choose a Destination",
            description: "Select a place for your trip easily and know the exact cost of the tour.",
            tag: 1),
        OnboardingItem(
            imageName: "onboarding_slide_3",
            title: "Fly to Desitination",
            description: "Finally, get ready for the tour and go to your desire destination.",
            tag: 2),
    ]
    
    var body: some View {
        VStack {
            ZStack {
                TabView(selection: $activeSlide) {
                    ForEach(slides, id: \.self) {item in
                        OnboardingSlide(onboardingItem: item).tag(item.tag)
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                VStack {
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(slides, id: \.self) { slide in
                            RoundedRectangle(cornerRadius: 13)
                                .frame(width: slide.tag == activeSlide ? 62 : 26, height: 11)
                                .foregroundColor(slide.tag == activeSlide ? Color("green") : Color("grey"))
                                .animation(.default, value: activeSlide)
                        }
                    }
                    .padding(.bottom, 84)
                }
            }
        }.ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct OnboardingSlide: View {
    var onboardingItem: OnboardingItem;
    
    var body: some View {
        VStack {
            Image(onboardingItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.width * 0.65)
//            .frame(width: 300, height: 300)
            Text(onboardingItem.title)
                .bold()
                .font(.title2)
                .padding(.top, 42)
            
            Text(onboardingItem.description)
                .font(.body)
                .padding(.top, 12)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 62)
                .foregroundColor(Color(.gray))
        }
        .frame(maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
