import SwiftUI

struct OnboardingView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @State var pagginationIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            HStack(spacing: 5) {
                ForEach(0..<3, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(index == pagginationIndex ? Color("FEC90D") : Color("428C6B"))
                        .frame(maxWidth: .infinity, maxHeight: 8)
                }
            }
            
            Image(onboardingData[pagginationIndex].image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 10) {
                Text("Niagara Journey")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .black))
                
                Text(onboardingData[pagginationIndex].description)
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 10) {
                Button(action: {
                    navigationViewModel.navigate(to: .signUp)
                }) {
                    Text("Skip")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("428C6B"))
                        )
                }
                .opacity(pagginationIndex == 2 ? 0 : 1)
                
                Button(action: {
                    if pagginationIndex < 2 {
                        withAnimation(.smooth) {
                            pagginationIndex += 1
                        }
                    } else {
                        navigationViewModel.navigate(to: .signUp)
                    }
                }) {
                    Text("Next")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundStyle(Color("3A3A3A"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("FEC90D"))
                        )
                }
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    OnboardingView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

