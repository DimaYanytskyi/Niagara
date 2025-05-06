import SwiftUI

struct SplashView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("username") private var username: String = ""
    @AppStorage("logged") private var logged: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Loading...")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if logged {
                    navigationViewModel.navigate(to: .home)
                } else {
                    if username != "" {
                        navigationViewModel.navigate(to: .signIn)
                    } else {
                        navigationViewModel.navigate(to: .onboarding)
                    }
                }
                
            }
        }
    }
}

