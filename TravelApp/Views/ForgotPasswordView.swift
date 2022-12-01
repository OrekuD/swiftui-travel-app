//
//  ForgotPasswordView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = "";
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
            
            Text("Forgot Password")
                .bold()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
    
            
            VStack {
                Text("Please Enter Your") + Text(" Email Address / Phone Nuber ").bold() + Text("To Reset Your Password")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 2)
            .padding(.bottom, 48)
            
            TextInput(value: $email, isPasswordVisible: .constant(true), isPasswordField: false, placeholder: "Enter Email / Phone Number")
            
            VStack {
                NavigationLink {
                    EnterPhoneNumberView()
                } label: {
                    ButtonLabel(isDisabled: false, label: "Send")
                }
            }.padding(.vertical, 18)

            
        }
        .ignoresSafeArea()
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color(.secondarySystemBackground))
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
