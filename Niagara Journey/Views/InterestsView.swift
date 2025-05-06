import SwiftUI

struct InterestsView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("Select your interest")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
                .padding(.horizontal)
            
            Image("mask")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 12) {
                InterestsButton(name: "Hotels") {
                    navigationViewModel.navigate(to: .welcome)
                }
                InterestsButton(name: "Restaurants") {
                    navigationViewModel.navigate(to: .welcome)
                }
                InterestsButton(name: "City Interesting Facts") {
                    navigationViewModel.navigate(to: .welcome)
                }
                InterestsButton(name: "Skip") {
                    navigationViewModel.navigate(to: .welcome)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    InterestsView()
        .background(Color("206E49").ignoresSafeArea(.all))
}
