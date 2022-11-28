//
//  TextInput.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI



struct TextInput: View {
    @Binding var value: String;
    @Binding var isPasswordVisible: Bool;
    var isPasswordField: Bool = true;
    var placeholder: String;
    var isPhoneNumberField: Bool = false;
    
    @EnvironmentObject var viewModel: TravelAppViewModel

    
    var body: some View {
        HStack {
            
            if isPhoneNumberField {
                HStack {
                    Menu {
                        ForEach(viewModel.countriesData, id: \.self) {item in
                            Button {
                                print(item.flag)
                                viewModel.setCountry(data: item)
                            } label: {
                                HStack {
                                    Text(item.name)
                                    Text(item.flag)
                                }
                            }

                        }
                    } label: {
                        Text(viewModel.country.flag).font(.title)
                    }


                    Rectangle()
                        .frame(width: 1, height: 34)
                        .foregroundColor(Color("darkgrey"))
                }
            }
            
            if isPasswordField {
                if isPasswordVisible {
                    TextField("", text: $value)
                        .modifier(PlaceholderStyle(showPlaceHolder: value.isEmpty, placeholder: placeholder))
                } else {
                    SecureField("", text: $value)
                        .modifier(PlaceholderStyle(showPlaceHolder: value.isEmpty, placeholder: placeholder))
                }
            } else {
                TextField("", text: $value)
                    .modifier(PlaceholderStyle(showPlaceHolder: value.isEmpty, placeholder: placeholder))
            }
            
            if isPasswordField {
                Button  {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color("darkgrey"))
                }
                
            }
        }
        .padding(.horizontal, 14)
        .frame(height: 57)
        .background(.white)
        .cornerRadius(15)
        .padding(.bottom, 12)
        .onAppear {
            print("appear")
        }
    }
    
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.horizontal, 4)
                    .foregroundColor(Color("darkgrey"))
            }
            content
                .foregroundColor(Color.primary)
                .padding(5.0)
        }
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(value: .constant(""), isPasswordVisible: .constant(false), isPasswordField: false, placeholder: "", isPhoneNumberField: true)
            .padding(.horizontal, 24)
            .frame(height: 200).background(.gray)
            .environmentObject(TravelAppViewModel())
//        TextInput(
    }
}
