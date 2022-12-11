//
//  HomeView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 01/12/2022.
//

import SwiftUI



struct Category: Identifiable {
    var id = UUID()
    var label: String
    var value: Int
    var image: String
}


struct HomeView: View {
    @State var selectedTab: Int = 0;
    @Environment(\.colorScheme) var colorScheme;
    @State var isVisible: Bool = false;
    @EnvironmentObject var viewModel: TravelAppViewModel;    
    @Namespace var animation;

    
    var categories: [Category] = [
        .init(label: "Trips", value: 0, image: "category_trips"),
        .init(label: "Hotel", value: 1, image: "category_hotel"),
        .init(label: "Transport", value: 2, image: "category_transport"),
        .init(label: "Events", value: 3, image: "category_events"),
    ]
    
    var categorySize: CGFloat = ((UIScreen.main.bounds.width - 48) / 4) * 0.55;
    
    var slideSize: CGFloat = (UIScreen.main.bounds.width - 48) * 0.6;
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Button {
                        print("")
                    } label: {
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: 22, height: 2.5)
                                .foregroundColor(Color("black"))
                            
                            Rectangle()
                                .frame(width: 16, height: 2.5)
                                .foregroundColor(Color("black"))
                        }
                    }
                    Spacer()
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color("black"))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                Text("Where Do You\nWant To Go?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .foregroundColor(Color("black"))
                    .padding(.top, 32)
                    .padding(.bottom, 12)
                    .lineSpacing(10)
                    .padding(.horizontal, 24)
                
                HStack(spacing: 0) {
                    NavigationLink {
                        SearchView()
                    } label: {
                        HStack(spacing: 0) {
                            Text("Serch your trip")
                                .padding(.leading, 24)
                                .foregroundColor(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5))
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Color("green"))
                                .cornerRadius(30)
                        }
                        .frame(width: UIScreen.main.bounds.width - 48)
                        .padding(8)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(60)
                    }
                    
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                
                
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
                            .padding(.leading, 12)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
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
                                                
                                                Spacer()
                                                Button {
                                                    print("add")
                                                } label: {
                                                    Image(systemName: "heart")
                                                        .resizable()
                                                        .frame(width: 18, height: 18)
                                                        .padding(9)
                                                        .background(.white)
                                                        .cornerRadius(100)
                                                        .foregroundColor(Color("green"))
                                                }
                                                
                                            }
                                            .padding(.horizontal, 16)
                                        }
                                        .padding(.bottom, 16)
                                        .frame(maxHeight: .infinity)
                                        .background(.black.opacity(0.2))
                                    }
                                }
                                .frame(width: slideSize, height: slideSize * 1.3)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(24)
                                .padding(.trailing, 24)
                            }

                        }
                    }
                    .padding(.leading, 32)
                }
                
                Text("Popular Categories")
                    .bold()
                    .foregroundColor(Color("black"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 12)
                    .padding(.top, 32)
                
                HStack(spacing: categorySize * 0.5) {
                    ForEach(categories) { category in
                        Button {
                            print("")
                        } label: {
                            VStack {
                                Image(category.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: categorySize, height: categorySize)
                                Text(category.label)
                                    .font(.subheadline)
                                    .foregroundColor(Color("darkgrey"))
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 80)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView().environmentObject(TravelAppViewModel())
    }
}
