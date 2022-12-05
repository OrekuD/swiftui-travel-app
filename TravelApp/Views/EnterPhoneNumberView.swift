//
//  SignInView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    @State var email: String = "";
    @State var fullname: String = "";
    @State var password: String = "";
    @State var confirmPassword: String = "";
    @State var isPasswordVisible: Bool = false;
    @State var isConfirmPasswordVisible: Bool = false;
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Register")
                .bold()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 78)
            
            VStack {
                Text("Please Enter") + Text(" Your Phone Nuber, ").bold() + Text("So We Can Verify You.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 2)
            .padding(.bottom, 12)
            
            Text("Enter Your Phone Number")
                .padding(.top, 24)
                .padding(.bottom, 8)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextInput(value: $email, isPasswordVisible: .constant(true), isPasswordField: false, placeholder: "Enter Email / Phone Number", isPhoneNumberField: true)
            
            NavigationLink {
                AccountCreatedView()
            } label: {
                ButtonLabel(isDisabled: false, label: "Next")
            }
            
            Text("Already have an account?")
                .padding(.top, 36)
                .padding(.bottom, 18)
            
            NavigationLink(destination: SignInView()) {
                VStack {
                    Text("LOGIN")
                        .tracking(4)
                        .foregroundColor(Color("green"))
                        .padding(.bottom, 2)
                    
                    Rectangle()
                        .frame(width: 26, height: 1)
                        .foregroundColor(Color("green"))
                }
            }

        }
        .ignoresSafeArea()
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .background(Color(.secondarySystemBackground))
    }
}

struct EnterPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPhoneNumberView().environmentObject(TravelAppViewModel())
    }
}
