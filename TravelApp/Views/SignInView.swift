//
//  SignInView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = "";
    @State var password: String = "";
    @State var isPasswordVisible: Bool = false;
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Log In")
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
            
            TextInput(value: $email, isPasswordVisible: .constant(true), isPasswordField: false, placeholder: "Enter Email / Phone Number")
            
            TextInput(value: $password, isPasswordVisible: $isPasswordVisible, isPasswordField: true, placeholder: "Password")
            

            NavigationLink {
                ForgotPasswordView()
            } label: {
                Text("Forgot Password?")
                    .foregroundColor(Color("green"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .bold()
            }

            
            Button {
                print("da")
            } label: {
                ButtonLabel(isDisabled: false, label: "Login")
            }.padding(.vertical, 18)

            
            Text("Don't have an account?").padding(.vertical, 18)
            
            NavigationLink(destination: SignUpView()) {
                VStack {
                    Text("REGISTER")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SocialButton: View {
    var label: String;
    var color: Color;
    
    var body: some View {
        Text(label)
            .frame(width: UIScreen.main.bounds.width * 0.41, height: 51)
            .background(color.opacity(0.25))
            .foregroundColor(color)
            .cornerRadius(5)
            .bold()
            .tracking(2)
    }
}
