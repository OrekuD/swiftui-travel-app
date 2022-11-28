//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Cyboticx LLC on 26/11/2022.
//

import SwiftUI

@main
struct TravelAppApp: App {
    @StateObject var viewModel: TravelAppViewModel = TravelAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
