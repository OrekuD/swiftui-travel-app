//
//  LocationView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 02/12/2022.
//

import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    var label: String
    var value: Int
}

struct LocationView: View {
    var animation: Namespace.ID;
    @EnvironmentObject var viewModel: TravelAppViewModel;
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>;
    @Environment(\.safeAreaInsets) private var safeAreaInsets;
    @State var selectedSection: Int = 0;
    
    var sections: [Section] = [
        .init(label: "Overview", value: 0),
        .init(label: "Details", value: 1),
        .init(label: "Reviews", value: 2),
        .init(label: "Costs", value: 3),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("location_3")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
            .zIndex(1)
            
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
                            .padding(12)
                            .background(Color(.systemBackground))
                            .cornerRadius(40)
                            .clipped()
                    }
                    
                    Spacer()
                    
                    Button {
//                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("green"))
                            .padding(12)
                            .background(Color(.systemBackground))
                            .cornerRadius(40)
                            .clipped()
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, safeAreaInsets.top)
                .zIndex(2)
                
                Spacer()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Paris, France")
                             .font(.title)
                             .bold()
                        Spacer()
                        Text("$1000")
                             .font(.title)
                             .foregroundColor(Color("green"))
                             .bold()
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            .padding(.trailing, 4)
                        
                        Text("4.9 (2.7K)")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("* Estimated Cost")
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        ForEach(sections) {section in
                            let isActive = section.value == selectedSection
                        
                            Button {
                                    selectedSection = section.value
                            } label: {
                                VStack(spacing: 0) {
                                    Text(section.label)
                                        .foregroundColor(isActive ? Color("green") : .gray)
//                                        .font(.subheadline)
                                    
                                    Circle()
                                        .frame(width: 6, height: 6)
                                        .foregroundColor(isActive ? Color("green") : .gray)
                                        .padding(.top, 6)
                                }
                            }

                            
                            if section.value < 3 {
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 32)
                    .frame(maxWidth: .infinity)
                    
                    Text("Paris possesses a rich and attractive cultural scene with shows, activities and festivals.")
                        .padding(.vertical, 24)
                        .foregroundColor(.gray)
//                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 0) {
                        HStack(alignment: .top, spacing: 0) {
                            Image(systemName: "clock.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.blue)
                                .padding(.top, 3)
                                .frame(width: 17, height: 17)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("5 Days")
//                                    .font(.subheadline)
                                    .bold()
                                
                                Text("Duration")
//                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding(.top, 6)
                            }
                            .padding(.leading, 6)
                        }
                        Spacer()
                        HStack(alignment: .top, spacing: 0) {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.blue)
                                .padding(.top, 3)
                                .frame(width: 17, height: 17)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("625 KM")
//                                    .font(.subheadline)
                                    .bold()
                                
                                Text("Distance")
//                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding(.top, 6)
                            }
                            .padding(.leading, 6)
                        }
                        Spacer()
                        HStack(alignment: .top, spacing: 0) {
                            Image(systemName: "sun.max.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.blue)
                                .padding(.top, 3)
                                .frame(width: 17, height: 17)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("21° C")
//                                    .font(.subheadline)
                                    .bold()
                                
                                Text("Sunny")
//                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .padding(.top, 6)
                            }
                            .padding(.leading, 6)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            print("j")
                        } label: {
                            VStack {
                                Text("$1000")
                                    .foregroundColor(Color("green"))
                                    .bold()
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.33)
                            .cornerRadius(50)
                            .overlay {
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color("green"), lineWidth: 2)
                                    .frame(height: 57)
                            }
                        }
                        
                        Spacer()
                        Button {
                            print("j")
                        } label: {
                            ButtonLabel(isDisabled: false, label: "Book now")
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.48)
                        .cornerRadius(50)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 2, y: 10)
                    }
                        
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, safeAreaInsets.bottom)
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.52)
                .background(Color(.systemBackground))
                .cornerRadius(50)
            }
            .zIndex(2)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationTitle("")
        .navigationBarHidden(true)
        .frame(maxHeight: UIScreen.main.bounds.height)
        .background(Color(.systemBackground))
    }
}

struct LocationView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        LocationView(animation: namespace)
    }
}
