import SwiftUI

struct WelcomeView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("selectedAvatar") var selectedAvatar: String = "image1"
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("Welcome, Username!")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
                .padding(.horizontal)
            
            Image(selectedAvatar)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 296)
                
            Button(action: {
                navigationViewModel.navigate(to: .home)
            }) {
                Text("Continue")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("3A3A3A"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("FEC90D"))
                    )
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

