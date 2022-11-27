//
//  TextInput.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 27/11/2022.
//

import SwiftUI

struct TextInput: View {
    @Binding var value: String;
    @Binding var isPsswordVisible: Bool;
    var isPsswordField: Bool = true;
    var placeholder: String;
    
    
    var body: some View {
        HStack {
            
            if isPsswordField {
                if isPsswordVisible {
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
            
            if isPsswordField {
                Button  {
                    isPsswordVisible.toggle()
                } label: {
                    Image(systemName: isPsswordVisible ? "eye" : "eye.slash")
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
        TextInput(value: .constant(""), isPsswordVisible: .constant(false), isPsswordField: false, placeholder: "")
            .padding(.horizontal, 24)
            .frame(height: 200).background(.gray)
    }
}

