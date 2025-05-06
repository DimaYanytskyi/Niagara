import SwiftUI

struct AvatarView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("selectedAvatar") var selectedAvatar: String = "image1"
    let avatars = [
        "image1", "image2", "image3", "image4", "image5", "image6"
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("Choose your avatar")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(avatars, id: \.self) { avatar in
                    Image(avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 148)
                        .padding(8)
                        .onTapGesture {
                            withAnimation {
                                selectedAvatar = avatar
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(selectedAvatar == avatar ? .white.opacity(0.1) : .white.opacity(0.0))
                        )
                }
            }
            
            Button(action: {
                navigationViewModel.navigate(to: .interests)
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
    AvatarView()
        .background(Color("206E49").ignoresSafeArea(.all))
}
