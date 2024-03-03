//
//  AeroNex_PilotApp.swift
//  AeroNex_Pilot
//
//  Created by Devansh Agarwal on 29/02/24.
//

import SwiftUI
import Firebase
@main
struct AeroNex_PilotApp: App {
    init(){
        
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            RootView()
        }
    }
}
