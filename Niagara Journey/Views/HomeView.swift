import SwiftUI

struct HomeView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @AppStorage("selectedAvatar") var selectedAvatar: String = "image1"
    @AppStorage("username") var username: String = "Guest"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                Image(selectedAvatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                Text(username)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .heavy))
                
                Spacer()
                
                Image(systemName: "gearshape")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.1))
                    )
                    .onTapGesture {
                        navigationViewModel.navigate(to: .settings)
                    }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Popular Hotels")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(hotels.prefix(3), id: \.self) { hotel in
                                PopularCard(hotel: hotel)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            navigationViewModel.navigate(to: .hotelDetails(hotel))
                                        }
                                    }
                            }
                        }
                    }
                    
                    Text("Discover")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Hotels")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("Find the perfect place to stay in Niagara Falls. Browse top-rated hotels, cozy inns, and luxurious resorts")
                            .foregroundStyle(.white)
                            .font(.system(size: 16))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Image("hotels")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                    )
                    .padding(.vertical, 32)
                    .onTapGesture {
                        withAnimation {
                            navigationViewModel.navigate(to: .hotelMap)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Restaurants")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("Find the perfect restaurant in Niagara Falls. Browse top-rated restaurants")
                            .foregroundStyle(.white)
                            .font(.system(size: 16))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Image("restaurants")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                    )
                    .padding(.vertical, 16)
                    .onTapGesture {
                        withAnimation {
                            navigationViewModel.navigate(to: .restaurantMap)
                        }
                    }
                    
                    HStack(spacing: 16) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Favorites")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                        .padding(.vertical)
                        .onTapGesture {
                            navigationViewModel.navigate(to: .favorites)
                        }
                        
                        HStack(alignment: .center, spacing: 8) {
                            Text("Quizes")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            
                            Image(systemName: "questionmark")
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.1))
                        )
                        .padding(.vertical)
                        .onTapGesture {
                            navigationViewModel.navigate(to: .quizList)
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
    HomeView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

