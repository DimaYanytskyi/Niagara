import Foundation

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    
    @Published private(set) var favoriteHotels: [Hotel] = [] {
        didSet { saveFavorites() }
    }
    @Published private(set) var favoriteRestaurants: [Restaurant] = [] {
        didSet { saveFavorites() }
    }
    
    private let hotelsKey = "favoriteHotels"
    private let restaurantsKey = "favoriteRestaurants"
    
    private init() {
        loadFavorites()
    }
    
    func toggleFavorite(hotel: Hotel) {
        if let index = favoriteHotels.firstIndex(of: hotel) {
            favoriteHotels.remove(at: index)
        } else {
            favoriteHotels.append(hotel)
        }
    }
    
    func toggleFavorite(restaurant: Restaurant) {
        if let index = favoriteRestaurants.firstIndex(of: restaurant) {
            favoriteRestaurants.remove(at: index)
        } else {
            favoriteRestaurants.append(restaurant)
        }
    }
    
    func isFavorite(hotel: Hotel) -> Bool {
        return favoriteHotels.contains(hotel)
    }
    
    func isFavorite(restaurant: Restaurant) -> Bool {
        return favoriteRestaurants.contains(restaurant)
    }
    
    private func saveFavorites() {
        if let hotelData = try? JSONEncoder().encode(favoriteHotels) {
            UserDefaults.standard.set(hotelData, forKey: hotelsKey)
        }
        if let restaurantData = try? JSONEncoder().encode(favoriteRestaurants) {
            UserDefaults.standard.set(restaurantData, forKey: restaurantsKey)
        }
    }
    
    private func loadFavorites() {
        if let hotelData = UserDefaults.standard.data(forKey: hotelsKey),
           let hotels = try? JSONDecoder().decode([Hotel].self, from: hotelData) {
            favoriteHotels = hotels
        }
        if let restaurantData = UserDefaults.standard.data(forKey: restaurantsKey),
           let restaurants = try? JSONDecoder().decode([Restaurant].self, from: restaurantData) {
            favoriteRestaurants = restaurants
        }
    }
}

