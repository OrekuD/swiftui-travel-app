//
//  ProfileView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 01/12/2022.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme;
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.primary)
                        .frame(width: 40, height: 40)
                        .background(colorScheme == .dark ? Color(.secondarySystemBackground) : .white)
                        .cornerRadius(50)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
                }

                Text("Account")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("location_1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("green"))
                            .overlay {
                                Circle()
                                    .stroke(Color(.secondarySystemBackground), lineWidth: 4)
                                    .frame(width: 20, height: 20)
                            }
                            .offset(x: 46, y: -38)
                    }
                    .padding(.top, 32)
                
                    Text("Matt Reeves")
                        .font(.title)
                        .bold()
                
                    Text("ID : 57890964")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.gray.opacity(0.8))
                
                Image("message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: 70)
                    .background(Color("lightgreen").opacity(0.58))
                    .cornerRadius(20)
                    .padding(.top, 6)
                    .padding(.bottom, 48)
                
                
                Button {
                    print("sd")
                } label: {
                    SettingItem(iconName: "settings", label: "Preferences", hasChevronIcon: true, isSecurity: false)
                }
                
                Button {
                    print("sd")
                } label: {
                    SettingItem(iconName: "security", label: "Account Security", hasChevronIcon: true, isSecurity: true)
                }
                
                Button {
                    print("sd")
                } label: {
                    SettingItem(iconName: "help", label: "Help", hasChevronIcon: true, isSecurity: false)
                }
                
                Button {
                    print("dd")
                } label: {
                    SettingItem(iconName: "logout", label: "Logout", hasChevronIcon: false, isSecurity: false)
                }
                
                VStack {
                    
                }
                .frame(height: 100)
            }
        }
        .padding(.horizontal, 24)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct SettingItem: View {
    var iconName: String;
    var label: String;
    var hasChevronIcon: Bool;
    var isSecurity: Bool;
    
    var body: some View {
        HStack(alignment: isSecurity ? .top : .center, spacing: 0) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, isSecurity ? 2 : 0)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(.title3)
                    .foregroundColor(.primary)
                
                if isSecurity {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity, maxHeight: 10)
                            .padding(.vertical, 20)
                            .foregroundColor(Color("green").opacity(0.3))
                            .overlay(alignment: .leading, content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color("green"))
                                    .frame(maxWidth: 65, maxHeight: 10, alignment: .leading)
                            })
                        
                        Text("Intermediate")
                            .font(.body)
                            .bold()
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 48)
                }
                
            }
            .padding(.leading, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            if hasChevronIcon {
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.gray)
                    .padding(.top, isSecurity ? 8 : 0)
            }
            
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
