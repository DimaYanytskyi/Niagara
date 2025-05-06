import SwiftUI

struct FavoritesView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    @ObservedObject var favoritesManager = FavoritesManager.shared
    
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
                
                Text("Favorites")
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
                    ForEach(favoritesManager.favoriteHotels) { hotel in
                        VStack(alignment: .leading, spacing: 12) {
                            Image(hotel.id)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 150)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .cornerRadius(8)
                            
                            Text(hotel.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    navigationViewModel.navigate(to: .hotelDetails(hotel))
                                }) {
                                    HStack {
                                        Text("See Details")
                                            .font(.body)
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(8)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white.opacity(0.1))
                        )
                        .cornerRadius(8)
                        .transition(.move(edge: .bottom))
                    }
                    
                    ForEach(favoritesManager.favoriteRestaurants) { restaurant in
                        VStack(alignment: .leading, spacing: 12) {
                            Image(restaurant.id)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 150)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .cornerRadius(8)
                            
                            Text(restaurant.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    navigationViewModel.navigate(to: .restaurantDetails(restaurant))
                                }) {
                                    HStack {
                                        Text("See Details")
                                            .font(.body)
                                            .foregroundColor(.white)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                    }
                                    .padding(8)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white.opacity(0.1))
                        )
                        .cornerRadius(8)
                        .transition(.move(edge: .bottom))
                    }
                    
                    if favoritesManager.favoriteHotels.isEmpty && favoritesManager.favoriteRestaurants.isEmpty {
                        Text("The information you liked will be displayed here")
                            .foregroundStyle(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                    }
                }
                .padding(.top)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    FavoritesView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

