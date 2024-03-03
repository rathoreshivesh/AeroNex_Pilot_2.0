import SwiftUI
import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel{
    let idToken: String
    let accessToken: String
}

@MainActor
final class AuthenticationViewModel: ObservableObject{
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else{
            throw URLError(.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else{
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)

    }
}

struct pilotLoginOrSignUp: View {
    //@Binding var showSignInView: Bool
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var isAuthenticated = false
    var body: some View {
        VStack {
            
            aeroImg().padding(.top,25)
            
            Text("Login or Sign up")
                .font(.system(size: 28).bold())
            
            NavigationLink{
                pilotSignUp()
            } label: {
                Text("Continue with Email")
                                .foregroundColor(.white)
                                .frame(width: 360, height: 55)
                                .background(Color(red: 0.1, green: 0.11, blue: 0.12))
                                .cornerRadius(10)
                                .font(Font.custom("SF Pro", size: 18) .weight(.semibold))
            }

            HStack(alignment: .center, spacing: 10) {
                
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .icon, state: .normal)){
                    Task{
                        do{
                            try await viewModel.signInGoogle()
                            
                        } catch{
                            print(error)
                        }
                    }
                    
                }
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.84, green: 0.84, blue: 0.84), lineWidth: 1)
                        .overlay(Image("ic-Apple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                                 
                        )
                    .frame(width: 172, height: 50)
                }
                
                
               
        }
            termsAndCondition()
            
        }
    }
}

#Preview {
    pilotLoginOrSignUp()
}
