import SwiftUI
import CoreLocation

struct RestaurantDetailsView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    @ObservedObject var favoritesManager = FavoritesManager.shared
    
    let restaurant: Restaurant
    
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
                
                Text("Details")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
                
                Image(systemName: favoritesManager.isFavorite(restaurant: restaurant) ? "heart.fill" : "heart")
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
                        favoritesManager.toggleFavorite(restaurant: restaurant)
                    }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(restaurant.id)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    Text(restaurant.name)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Location: " + restaurant.locationString)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    HStack {
                        Image(systemName: "dollarsign.ring")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Price: " + restaurant.price)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    HStack {
                        Image(systemName: "star.circle")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Rating: " + restaurant.rating)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    Text(restaurant.description)
                        .foregroundStyle(.white.opacity(0.8))
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RestaurantDetailsView(restaurant: Restaurant(
        id: "restaurant1",
        name: "Table Rock House Restaurant",
        locationString: "6650 Niagara Parkway, Niagara Falls, ON",
        price: "$$$",
        rating: "4.5",
        description: "Table Rock House Restaurant offers a unique dining experience with its location adjacent to the Horseshoe Falls. Guests can enjoy panoramic views of the cascading waters through floor-to-ceiling windows while savoring locally inspired dishes. The menu emphasizes fresh, seasonal ingredients, and the restaurant is known for its signature Icewine Martini. The ambiance combines modern elegance with the natural beauty of Niagara Falls, making it a must-visit for both tourists and locals seeking a memorable meal.",
        location: CLLocationCoordinate2D(latitude: 43.0786, longitude: -79.0746)
    ))
        .background(Color("206E49").ignoresSafeArea(.all))
}
