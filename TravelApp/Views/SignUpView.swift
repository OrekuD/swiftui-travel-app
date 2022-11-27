//
//  SignInView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = "";
    @State var fullname: String = "";
    @State var password: String = "";
    @State var confirmPassword: String = "";
    @State var isPsswordVisible: Bool = false;
    @State var isConfirmPsswordVisible: Bool = false;
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Register")
                .bold()
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 78)
            
            HStack {
                Button {
                    print("okay")
                } label: {
                    SocialButton(label: "GOOGLE", color: Color("red"))
                }
                Spacer()
                Button {
                    print("okay")
                } label: {
                    SocialButton(label: "FACEBOOK", color: Color("blue"))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 24)
            
            Text("OR")
                .tracking(4)
                .foregroundColor(Color("darkgrey"))
                .padding(.vertical, 24)
            
            TextInput(value: $email, isPsswordVisible: .constant(true), isPsswordField: false, placeholder: "Full Name")
            
            TextInput(value: $email, isPsswordVisible: .constant(true), isPsswordField: false, placeholder: "Enter Email / Phone Number")
            
            TextInput(value: $password, isPsswordVisible: $isPsswordVisible, isPsswordField: true, placeholder: "Password")
            
            TextInput(value: $confirmPassword, isPsswordVisible: $isConfirmPsswordVisible, isPsswordField: true, placeholder: "Confirm Password")
            
            Button {
                print("da")
            } label: {
                ButtonLabel(isDisabled: false, label: "Register")
            }.padding(.vertical, 18)

            
            Text("Already have an account?").padding(.vertical, 18)
            
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
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(Color(.secondarySystemBackground))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
