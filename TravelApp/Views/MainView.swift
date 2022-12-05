//
//  MainView.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 01/12/2022.
//

import SwiftUI

struct Screen: Identifiable {
    var id = UUID()
    var label: String
    var icon_default: String
    var icon_active: String
    var tag: Int
}

struct MainView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @State var activeScreen: Int = 0;
    @EnvironmentObject var viewModel: TravelAppViewModel;
    
    var screens: [Screen] = [
        .init(label: "Home", icon_default: "home_default", icon_active: "home_active", tag: 0),
        .init(label: "Explore", icon_default: "explore_default", icon_active: "explore_active", tag: 1),
        .init(label: "Notifications", icon_default: "notifications_default", icon_active: "notifications_active", tag: 2),
        .init(label: "Profile", icon_default: "profile_default", icon_active: "profile_active", tag: 3),
    ]
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            TabView(selection: $activeScreen) {
                HomeView()
                    .tag(0)
                ExploreView()
                    .tag(1)
                NotificationsView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            
            VStack(spacing: 0) {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(screens) {screen in
                        let isActive = activeScreen == screen.tag
                        
                        Button {
                            withAnimation(.easeInOut) {
                                activeScreen = screen.tag
                            }
                        } label: {
                            HStack(spacing: 0) {
                                Image(isActive ? screen.icon_active : screen.icon_default)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 22)
                                
                                if isActive {
                                    Text(screen.label)
                                        .font(.subheadline)
                                        .padding(.leading, 6)
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                            .padding(.horizontal, isActive ? 12 : 24)
                            .padding(.leading, activeScreen == 0 && screen.tag == 1 ? 12 : 0)
                            .padding(.trailing, activeScreen == 1 && screen.tag == 0 ? 12 : 0)
                            .padding(.leading, activeScreen == 1 && screen.tag == 2 ? 12 : 0)
                            .padding(.trailing, activeScreen == 2 && screen.tag == 1 ? 12 : 0)
                            .padding(.leading, activeScreen == 2 && screen.tag == 3 ? 10 : 0)
                            .padding(.trailing, activeScreen == 3 && screen.tag == 2 ? 12 : 0)
                            .frame(height: 40)
                            .background(Color("green").opacity(isActive ? 1.0 : 0.0))
                            .cornerRadius(14)
                            .clipped()
                        }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.top, safeAreaInsets.bottom * 0.6)
                .padding(.bottom, safeAreaInsets.bottom)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }
        }
        .accentColor(Color("green"))
        .navigationBarBackButtonHidden()
        .navigationTitle("")
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(TravelAppViewModel())
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
