//
//  VerifyCodeView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 30/11/2022.
//

import SwiftUI

struct VerifyCodeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>;
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    BackButtonLabel()
                }
            }
            .padding(.top, 78)
            .padding(.bottom, 32)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Verify code")
                .bold()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
    
            
            VStack {
                Text("Check Your SMS Inbox, We Have Sent You The Code At") + Text(" +00 000 0000").bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 2)
            .padding(.bottom, 48)
            
            // TODO: add one time code input
            
            HStack {
                Text("Didn't Receive A Code?")
                    .foregroundColor(.black.opacity(0.6))
                Button {
                    print("Kkd")
                } label: {
                    Text("Resend Code")
                        .foregroundColor(Color("green"))
                        .underline()
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
            
            NavigationLink(destination: AccountCreatedView()) {
                ButtonLabel(isDisabled: false, label: "Next")
            }
            

        }
        .ignoresSafeArea()
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color(.secondarySystemBackground))
    }
}

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView()
    }
}
