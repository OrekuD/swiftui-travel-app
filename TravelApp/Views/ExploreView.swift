//
//  ExploreView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 01/12/2022.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewModel: TravelAppViewModel
    @Namespace var animation;
    @State var selectedTab: Int = 0;
    
    var slideSize: CGFloat = (UIScreen.main.bounds.width - 48) * 0.48;
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Explore")
                    .font(.title)
                    .bold()
                    .padding(.leading, 12)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(viewModel.tabs, id: \.id) {item in
                            Button {
                                selectedTab = item.value
                            } label: {
                                VStack(spacing: 0) {
                                    Text(item.label)
                                        .foregroundColor(item.value == selectedTab ? Color("green") : Color("darkgrey"))
                                    Circle()
                                        .frame(width: 6, height: 6)
                                        .padding(.top, 6)
                                        .foregroundColor(item.value == selectedTab ? Color("green") : Color("darkgrey").opacity(0.0))
                                }
                            }
                            .padding(.trailing, 42)
                            .padding(.leading, 0)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                }
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: slideSize))], alignment: .center, spacing: 16) {
                    ForEach(viewModel.locationData) {location in
                        NavigationLink {
                            LocationView(animation: animation)
                        } label: {
                            VStack(spacing: 0) {
                                ZStack {
                                    Image(location.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: slideSize, height: slideSize * 1.3)
                                    
                                    VStack {
                                        Spacer()
                                        HStack(spacing: 0) {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text(location.name)
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                    .bold()
                                                    .padding(.bottom, 2)
                                                
                                                Text("Starting at $\(location.startPrice)")
                                                    .foregroundColor(.white)
                                                    .font(.footnote)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(.horizontal, 12)
                                    }
                                    .padding(.bottom, 16)
                                    .frame(maxHeight: .infinity)
                                    .background(.black.opacity(0.2))
                                }
                            }
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(24)
                        }
                        .frame(maxWidth: slideSize)
                    }
                }
                .padding(.top, 24)
                
                VStack {
                    
                }
                .frame(height: 100)
            }
            
        }.padding(.horizontal, 16)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView().environmentObject(TravelAppViewModel())
    }
}
