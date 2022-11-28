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
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 10, y: 10)
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
            
            Button {
                print("da")
            } label: {
                ButtonLabel(isDisabled: false, label: "Send")
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
