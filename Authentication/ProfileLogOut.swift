//
//  ProfileLogOut.swift
//  AeroNex_Pilot
//
//  Created by user2 on 03/03/24.
//

import SwiftUI

@MainActor
final class ProfileLogOutModel: ObservableObject{
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
    }
}

struct ProfileLogOut: View {
    
    @StateObject private var viewModel = ProfileLogOutModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do{
                        try viewModel.signOut()
                        showSignInView = true
                    } catch{
                        print(error)
                    }
                }
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileLogOut_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            ProfileLogOut(showSignInView: .constant(false))
        }
    }
}
