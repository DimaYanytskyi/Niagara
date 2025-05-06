import SwiftUI
import StoreKit

struct SettingsView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
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
                
                Text("Settings")
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
                    Button(action: {
                        navigationViewModel.navigate(to: .profile)
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Profile")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "person.fill")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                    
                    Button(action: {
                        navigationViewModel.navigate(to: .notifications)
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Notifications")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "message.fill")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                    
                    Button(action: {
                        navigationViewModel.navigate(to: .favorites)
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Favorites")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                    
                    Button(action: {
                        navigationViewModel.navigate(to: .support)
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Support")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "questionmark.circle")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                    
                    Button(action: {
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            if #available(iOS 18.0, *) {
                                AppStore.requestReview(in: windowScene)
                            } else {
                                SKStoreReviewController.requestReview(in: windowScene)
                            }
                        }
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Rate App")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "star.bubble")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                    
                    Button(action: {
                        navigationViewModel.navigate(to: "https://sites.google.com/view/niagara-find-your-rest/privacy-policy")
                    }) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Privacy Policy")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Spacer()
                            
                            Image(systemName: "list.clipboard")
                                .foregroundStyle(.white)
                        }
                        .padding(32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $navigationViewModel.web) {
            if let url = navigationViewModel.url {
                WebView(url: url)
            }
        }
    }
}

#Preview {
    SettingsView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

