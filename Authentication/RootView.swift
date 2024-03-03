//
//  RootView.swift
//  AeroNex_Pilot
//
//  Created by user2 on 02/03/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                ProfileLogOut(showSignInView: $showSignInView)
            }
        }
        .onAppear{
            let authuser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authuser == nil 
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack{
                pilotLoginOrSignUp()
            }
        }
    }
}

#Preview {
    RootView()
}
