//
//  PaymentView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 05/12/2022.
//

import SwiftUI

struct Detail: Identifiable {
    let id = UUID()
    var label: String
    var value: String
}

struct SpecialRequest: Identifiable {
    let id = UUID()
    var label: String
    var value: Int
}

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode;
    @Environment(\.colorScheme) var colorScheme;
    
    @State var selection: Int = 0;
    @State var selectedSpecialRequests: [Int] = [];
    
    var details: [Detail] = [
        .init(label: "1x Superior Suite", value: "1 night stay"),
        .init(label: "Check-in", value: "12 June 2021"),
        .init(label: "Check-out", value: "13 June 2021"),
        .init(label: "For", value: "1 Room, 2 Guests"),
    ]
    
    var specialRequests: [SpecialRequest] = [
        .init(label: "King bed", value: 0),
        .init(label: "Non-smoking room", value: 1),
        .init(label: "Queen bed", value: 2),
        .init(label: "Smoking room", value: 3),
        .init(label: "Twin beds", value: 4),
    ]
    
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
                
                Text("Payment")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: -10)
                    .font(.title3)
            }
            .padding(.horizontal, 12)
            .padding(.top, 6)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity)
            
            ScrollView(.vertical, showsIndicators: true) {
                
                HStack {
                    Image("location_3")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 60, maxHeight: 60)
                        .cornerRadius(12)
                    
                    VStack(alignment: .leading) {
                        Text("Emerald Bay Inn.")
                        
                        HStack {
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)
                                
                                Text("4.8")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .bold()
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("green")))
                            
                            Text("(4234 Reviews)")
                                .font(.caption)
                                .foregroundColor(Color("accent"))
                                .padding(.leading, 4)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.leading, 5)
                }
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(details) {detail in
                    HStack {
                        Text(detail.label)
                            .foregroundColor(Color("accent"))
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text(detail.value)
                            .foregroundColor(Color("purple"))
                            .font(.footnote)
                    }
                    .padding(.vertical, 14)
                
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .foregroundColor(Color("accent").opacity(colorScheme == .dark ? 0.4 : 0.15))
                }
                
                HStack {
                    Text("Total")
                        .foregroundColor(Color("accent"))
                        .font(.footnote) + Text(" (with taxes & fee)")
                        .foregroundColor(Color("accent"))
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("$250")
                        .foregroundColor(Color("purple"))
                        .font(.footnote)
                }
                .padding(.vertical, 14)
                
                Text("Special Request")
                    .foregroundColor(Color("purple"))
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.bottom, 12)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: (getRect() - 48) * 0.4))], alignment: .leading, spacing: 0) {
                    ForEach(specialRequests) { specialRequest in
                        Button {
                            if selectedSpecialRequests.contains(specialRequest.value) {
                                let index = selectedSpecialRequests.firstIndex(of: specialRequest.value)
                                if (index != nil) {
                                    selectedSpecialRequests.remove(at: index ?? 0)
                                }
                            } else {
                                selectedSpecialRequests.insert(specialRequest.value, at: 0)
                            }
                                
                        } label: {
                            HStack {
                                RadioButton(isSelected: selectedSpecialRequests.contains(specialRequest.value))
                                            
                                Text(specialRequest.label)
                                    .font(.footnote)
                                    .foregroundColor(Color("accent"))
                            }
                            .padding(.vertical, 6)
                            .padding(.leading, 3)
                            .padding(.bottom, 6)
                        }

                    }
                }
                
                HStack {
                    Text("Payment Method")
                        .foregroundColor(Color("purple"))
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 24)
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("d")
                    } label: {
                        Text("+ Add new card")
                            .foregroundColor(Color("accent"))
                            .font(.footnote)
                            .padding(.top, 24)
                    }

                }
                .padding(.bottom, 32)
                .frame(maxWidth: .infinity)
                
                NavigationLink {
                    Text("")
                } label: {
                    ButtonLabel(isDisabled: false, label: "Pay Now")
                }
            }
            .padding(.horizontal, 12)
        }
        .padding(.horizontal, 12)
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

struct RadioButton: View {
    var isSelected: Bool = false;
    
    var body: some View {
        VStack {
            if isSelected {
                VStack {
                    
                }
                .frame(width: 12, height: 12)
                .background(Circle().foregroundColor(Color("purple")))
            }
        }
        .frame(width: 20, height: 20)
        .background(Circle().stroke(Color("accent"), lineWidth: 1.5))
    }
}
