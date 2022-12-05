//
//  SearchResultsView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 05/12/2022.
//

import SwiftUI

struct SearchResultsView: View {
    @State var query: String = "San Francisco, 12 Jun - 13 Jun";
    @Namespace var animation
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
                
                Text("Hotels")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: -10)
                    .font(.title3)
            }
            .padding(.horizontal, 24)
            .padding(.top, 6)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity)
            
            
            ScrollView(.vertical, showsIndicators: true) {
                
                HStack {
                    TextField("Enter city name", text: $query)
                        .frame(maxWidth: .infinity)
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Color("accent"))
                }
                .padding(.horizontal, 18)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("lightpurple")))
                .padding(.horizontal, 12)
                .padding(.top, 12)
                .padding(.bottom, 32)
                .cornerRadius(12)
                
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("accent"))
                        
                        Text("Filters")
                            .foregroundColor(Color("accent"))
                    }
                    .frame(width: getRect() * 0.25, height: 42)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("lightpurple")))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "arrow.up.arrow.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("accent"))
                        
                        Text("Sort")
                            .foregroundColor(Color("accent"))
                    }
                    .frame(width: getRect() * 0.25, height: 42)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("lightpurple")))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "location.north")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("accent"))
                        
                        Text("Maps")
                            .foregroundColor(Color("accent"))
                    }
                    .frame(width: getRect() * 0.25, height: 42)
                    .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("lightpurple")))
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 32)
                .frame(maxWidth: .infinity)
                
                ForEach(0...5, id: \.self) {item in
                    NavigationLink {
                        LocationView(animation: animation)
                    } label: {
                        VStack(spacing: 0) {
                            Image("location_1")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 140)
                                .cornerRadius(16)
                            
                            HStack {
                                Text("Island")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                
                                Text("$126")
                                    .font(.title3)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 8)
                            .frame(maxWidth: .infinity)
                            
                            HStack {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                        .foregroundColor(.white)
                                    
                                    Text("4.5")
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color("green")))
                                
                                Text("(4245 reviews)")
                                    .font(.body)
                                    .foregroundColor(Color("accent"))
                                    .padding(.leading, 4)
                                
                                Spacer()
                                
                                Text("/ per night")
                                    .font(.body)
                                    .foregroundColor(Color("accent"))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.bottom, 32)
                    }.foregroundColor(.primary)
                    
                }
                .padding(.horizontal, 12)
            }
//            .padding(.top, 12)
            .padding(.horizontal, 12)
            
            
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}

extension View {
    func getRect() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
