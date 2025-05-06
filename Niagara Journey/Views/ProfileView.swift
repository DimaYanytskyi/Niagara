import SwiftUI

struct ProfileView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("selectedAvatar") var selectedAvatar: String = "image1"
    let avatars = [
        "image1", "image2", "image3", "image4", "image5", "image6"
    ]
    
    @AppStorage("username") private var username: String = ""
    @AppStorage("pass") private var password: String = ""
    @AppStorage("logged") private var logged: Bool = false
    
    @State private var showSaveAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 24)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                    )
                    .onTapGesture {
                        navigationViewModel.back()
                    }
                
                Spacer()
                
                Text("Profile")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                    )
                    .opacity(0)
            }
            
            ScrollView {
                VStack(spacing: 16) {
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
                    
                    TextField("", text: $username, prompt: Text("Username").foregroundColor(Color.white.opacity(0.5)))
                        .font(.system(size: 16, weight: .heavy))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                    SecureField("", text: $password, prompt: Text("Password").foregroundColor(Color.white.opacity(0.5)))
                        .font(.system(size: 16, weight: .heavy))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                    Button(action: {
                        showSaveAlert = true
                    }) {
                        Text("Save Changes")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundStyle(Color("3A3A3A"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("FEC90D"))
                            )
                    }
                    .alert("Saved", isPresented: $showSaveAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("Your profile changes have been saved.")
                    }
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            logged = false
                            navigationViewModel.navigate(to: .signIn)
                        }) {
                            Text("Log Out")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundStyle(Color("3A3A3A"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("FEC90D"))
                                )
                        }
                        
                        Button(action: {
                            logged = false
                            username = ""
                            password = ""
                            selectedAvatar = "image1"
                            navigationViewModel.navigate(to: .signUp)
                        }) {
                            Text("Delete Profile")
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
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ProfileView()
        .background(Color("206E49").ignoresSafeArea(.all))
}
