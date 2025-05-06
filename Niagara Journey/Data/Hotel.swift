import Foundation
import CoreLocation

struct Hotel : Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let locationString: String
    let price: String
    let rating: String
    let description: String
    let location: CLLocationCoordinate2D
}

let hotels: [Hotel] = [
    Hotel(
        id: "hotel1",
        name: "Niagara Falls Marriott Fallsview Hotel & Spa",
        locationString: "6740 Fallsview Blvd, Niagara Falls, ON",
        price: "$200/night",
        rating: "4.6",
        description: "The Niagara Falls Marriott Fallsview Hotel & Spa offers an unparalleled experience with its prime location overlooking the majestic Niagara Falls. Guests can indulge in luxurious accommodations featuring modern amenities and breathtaking views. The hotel boasts a full-service spa, indoor pool, and a state-of-the-art fitness center. Dining options include a fine-dining restaurant with panoramic views of the falls. Its proximity to major attractions like the Fallsview Casino and Table Rock Welcome Centre makes it an ideal choice for travelers seeking both relaxation and adventure.",
        location: CLLocationCoordinate2D(latitude: 43.0795, longitude: -79.0849)
    ),
    Hotel(
        id: "hotel2",
        name: "Sheraton Fallsview Hotel",
        locationString: "5875 Falls Ave, Niagara Falls, ON",
        price: "$220/night",
        rating: "4.5",
        description: "Sheraton Fallsview Hotel is a premier destination offering stunning views of Niagara Falls. Recently renovated, the hotel features modern guest rooms with floor-to-ceiling windows, providing guests with unparalleled vistas. Amenities include an indoor pool, fitness center, and the Christienne Fallsview Spa, renowned for its luxurious treatments. Dining options abound, with several on-site restaurants offering diverse cuisines. The hotel's central location provides direct access to Casino Niagara and the Fallsview Indoor Waterpark, making it perfect for both leisure and business travelers.",
        location: CLLocationCoordinate2D(latitude: 43.0907, longitude: -79.0716)
    ),
    Hotel(
        id: "hotel3",
        name: "Hilton Niagara Falls/Fallsview Hotel & Suites",
        locationString: "6361 Fallsview Blvd, Niagara Falls, ON",
        price: "$210/night",
        rating: "4.4",
        description: "Hilton Niagara Falls/Fallsview Hotel & Suites offers guests a luxurious stay with panoramic views of both the American and Canadian Horseshoe Falls. The hotel features spacious rooms equipped with modern amenities, including Jacuzzi tubs and fireplaces. Guests can enjoy a variety of dining options, from fine dining to casual eateries. The hotel is directly connected to the Fallsview Casino Resort and OLG Stage, providing easy access to entertainment and gaming. Its prime location and top-notch facilities make it a preferred choice for visitors.",
        location: CLLocationCoordinate2D(latitude: 43.0816, longitude: -79.0849)
    ),
    Hotel(
        id: "hotel4",
        name: "Embassy Suites by Hilton Niagara Falls Fallsview",
        locationString: "6700 Fallsview Blvd, Niagara Falls, ON",
        price: "$230/night",
        rating: "4.3",
        description: "Embassy Suites by Hilton Niagara Falls Fallsview offers spacious two-room suites with breathtaking views of the falls. Each suite includes a separate living area, kitchenette, and modern amenities. Guests can enjoy a complimentary cooked-to-order breakfast and evening reception. The hotel features an indoor pool, fitness center, and multiple dining options, including a steakhouse with panoramic views. Its proximity to attractions like the Niagara Parks Incline Railway and Table Rock Centre makes it an ideal base for exploring the area.",
        location: CLLocationCoordinate2D(latitude: 43.0789, longitude: -79.0840)
    ),
    Hotel(
        id: "hotel5",
        name: "The Oakes Hotel Overlooking the Falls",
        locationString: "6546 Fallsview Blvd, Niagara Falls, ON",
        price: "$180/night",
        rating: "4.2",
        description: "The Oakes Hotel Overlooking the Falls boasts one of the closest views of Niagara Falls, allowing guests to feel the mist from their rooms. The hotel offers comfortable accommodations with modern amenities, an indoor pool, and a sauna. Guests can dine at the on-site Applebee’s Grill & Bar or explore nearby attractions like the Fallsview Casino. The hotel's unique vantage point and eco-friendly practices make it a standout choice for travelers seeking both comfort and sustainability.",
        location: CLLocationCoordinate2D(latitude: 43.0780, longitude: -79.0845)
    ),
    Hotel(
        id: "hotel6",
        name: "Radisson Hotel & Suites Fallsview",
        locationString: "6733 Fallsview Blvd, Niagara Falls, ON",
        price: "$190/night",
        rating: "4.1",
        description: "Radisson Hotel & Suites Fallsview offers guests a comfortable stay with stunning views of the Horseshoe Falls. The hotel features spacious rooms equipped with modern amenities, including free Wi-Fi and flat-screen TVs. Guests can enjoy dining at the on-site restaurant or relax in the indoor pool and hot tub. Its convenient location near major attractions like the Skylon Tower and Journey Behind the Falls makes it an excellent choice for both leisure and business travelers.",
        location: CLLocationCoordinate2D(latitude: 43.0792, longitude: -79.0842)
    ),
    Hotel(
        id: "hotel7",
        name: "DoubleTree Fallsview Resort & Spa by Hilton",
        locationString: "6039 Fallsview Blvd, Niagara Falls, ON",
        price: "$200/night",
        rating: "4.3",
        description: "DoubleTree Fallsview Resort & Spa by Hilton combines modern comfort with rustic charm. Guests are welcomed with the brand's signature warm chocolate chip cookie and can enjoy spacious rooms with contemporary amenities. The hotel features an indoor saltwater pool, fitness center, and the AVEDA spa, offering a range of treatments. Dining options include a full-service restaurant and lounge. Its location provides easy access to the falls and nearby attractions, making it a popular choice for visitors.",
        location: CLLocationCoordinate2D(latitude: 43.0850, longitude: -79.0800)
    ),
    Hotel(
        id: "hotel8",
        name: "Old Stone Inn Boutique Hotel",
        locationString: "6080 Fallsview Blvd, Niagara Falls, ON",
        price: "$170/night",
        rating: "4.0",
        description: "Old Stone Inn Boutique Hotel offers a unique blend of historic charm and modern amenities. Housed in a former flour mill, the hotel features elegantly appointed rooms, an indoor pool, and a cozy lounge. Guests can dine at the on-site Flour Mill Restaurant, known for its farm-to-table cuisine. The hotel's location in the Fallsview district provides easy access to attractions like the Skylon Tower and Fallsview Casino. Its intimate atmosphere makes it ideal for romantic getaways.",
        location: CLLocationCoordinate2D(latitude: 43.0845, longitude: -79.0795)
    ),
    Hotel(
        id: "hotel9",
        name: "Sterling Inn & Spa",
        locationString: "5195 Magdalen St, Niagara Falls, ON",
        price: "$210/night",
        rating: "4.7",
        description: "Sterling Inn & Spa is Niagara Falls' premier boutique hotel, offering an intimate and luxurious experience. Each room is uniquely designed, featuring modern amenities and spa-inspired bathrooms. Guests can indulge in treatments at the full-service spa or dine at the award-winning AG Inspired Cuisine, known for its farm-to-table dishes. The hotel's central location provides easy access to the falls and nearby attractions, making it a perfect choice for couples seeking a romantic retreat.",
        location: CLLocationCoordinate2D(latitude: 43.0900, longitude: -79.0780)
    ),
    Hotel(
        id: "hotel10",
        name: "Wyndham Garden Niagara Falls Fallsview",
        locationString: "6170 Stanley Ave, Niagara Falls, ON",
        price: "$160/night",
        rating: "4.1",
        description: "Wyndham Garden Niagara Falls Fallsview offers guests a comfortable stay just steps away from the iconic falls. The hotel features modern rooms with amenities like free Wi-Fi and flat-screen TVs. Guests can enjoy the indoor pool, hot tub, and fitness center. Dining options include an on-site IHOP and proximity to various restaurants. Its location near attractions like the Fallsview Casino and Skylon Tower makes it an excellent base for exploring Niagara Falls.",
        location: CLLocationCoordinate2D(latitude: 43.0855, longitude: -79.0790)
    )
]
