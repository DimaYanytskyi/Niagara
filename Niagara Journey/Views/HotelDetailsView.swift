import SwiftUI
import CoreLocation

struct HotelDetailsView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    @ObservedObject var favoritesManager = FavoritesManager.shared
    
    let hotel: Hotel
    
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
                
                Image(systemName: favoritesManager.isFavorite(hotel: hotel) ? "heart.fill" : "heart")
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
                        favoritesManager.toggleFavorite(hotel: hotel)
                    }
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(hotel.id)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    Text(hotel.name)
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Location: " + hotel.locationString)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    HStack {
                        Image(systemName: "dollarsign.ring")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Price: " + hotel.price)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    HStack {
                        Image(systemName: "star.circle")
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("Rating: " + hotel.rating)
                            .foregroundStyle(.white.opacity(0.8))
                            .font(.system(size: 20))
                    }
                    
                    Text(hotel.description)
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
    HotelDetailsView(hotel: Hotel(
        id: "hotel1",
        name: "Niagara Falls Marriott Fallsview Hotel & Spa",
        locationString: "6740 Fallsview Blvd, Niagara Falls, ON",
        price: "$200/night",
        rating: "4.6",
        description: "The Niagara Falls Marriott Fallsview Hotel & Spa offers an unparalleled experience with its prime location overlooking the majestic Niagara Falls. Guests can indulge in luxurious accommodations featuring modern amenities and breathtaking views. The hotel boasts a full-service spa, indoor pool, and a state-of-the-art fitness center. Dining options include a fine-dining restaurant with panoramic views of the falls. Its proximity to major attractions like the Fallsview Casino and Table Rock Welcome Centre makes it an ideal choice for travelers seeking both relaxation and adventure.",
        location: CLLocationCoordinate2D(latitude: 43.0795, longitude: -79.0849)
    ))
        .background(Color("206E49").ignoresSafeArea(.all))
}
