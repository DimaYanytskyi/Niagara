import Foundation
import CoreLocation

struct Restaurant: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let locationString: String
    let price: String
    let rating: String
    let description: String
    let location: CLLocationCoordinate2D
}

let restaurants: [Restaurant] = [
    Restaurant(
        id: "restaurant1",
        name: "Table Rock House Restaurant",
        locationString: "6650 Niagara Parkway, Niagara Falls, ON",
        price: "$$$",
        rating: "4.5",
        description: "Table Rock House Restaurant offers a unique dining experience with its location adjacent to the Horseshoe Falls. Guests can enjoy panoramic views of the cascading waters through floor-to-ceiling windows while savoring locally inspired dishes. The menu emphasizes fresh, seasonal ingredients, and the restaurant is known for its signature Icewine Martini. The ambiance combines modern elegance with the natural beauty of Niagara Falls, making it a must-visit for both tourists and locals seeking a memorable meal.",
        location: CLLocationCoordinate2D(latitude: 43.0786, longitude: -79.0746)
    ),
    Restaurant(
        id: "restaurant2",
        name: "The Flour Mill Scratch Kitchen Restaurant",
        locationString: "6080 Fallsview Blvd, Niagara Falls, ON",
        price: "$$$",
        rating: "4.6",
        description: "Located within the historic Old Stone Inn Boutique Hotel, The Flour Mill Scratch Kitchen Restaurant offers a rustic yet refined dining experience. The restaurant prides itself on using locally sourced ingredients to craft dishes that reflect the flavors of the Niagara region. With its cozy ambiance, exposed stone walls, and attentive service, it's an ideal spot for romantic dinners or special occasions. The menu features a blend of traditional and contemporary cuisine, ensuring a delightful culinary journey.",
        location: CLLocationCoordinate2D(latitude: 43.0845, longitude: -79.0795)
    ),
    Restaurant(
        id: "restaurant3",
        name: "Skylon Tower Revolving Dining Room",
        locationString: "5200 Robinson St, Niagara Falls, ON",
        price: "$$$$",
        rating: "4.4",
        description: "Perched atop the iconic Skylon Tower, the Revolving Dining Room offers diners a 360-degree view of Niagara Falls and the surrounding region. As the restaurant slowly rotates, guests can enjoy a fine dining experience complemented by breathtaking vistas. The menu features a selection of international dishes, premium steaks, and fresh seafood. The combination of exquisite cuisine and unparalleled views makes it a popular choice for visitors seeking a unique dining experience.",
        location: CLLocationCoordinate2D(latitude: 43.0853, longitude: -79.0799)
    ),
    Restaurant(
        id: "restaurant4",
        name: "AG Inspired Cuisine",
        locationString: "5195 Magdalen St, Niagara Falls, ON",
        price: "$$$",
        rating: "4.7",
        description: "AG Inspired Cuisine is a farm-to-table restaurant that emphasizes the use of fresh, local ingredients to craft innovative dishes. The intimate setting, characterized by warm lighting and elegant decor, provides a perfect backdrop for a memorable dining experience. The menu changes seasonally, reflecting the best of Niagara's produce, meats, and wines. With its commitment to sustainability and culinary excellence, AG Inspired Cuisine has garnered acclaim from both locals and tourists.",
        location: CLLocationCoordinate2D(latitude: 43.0900, longitude: -79.0780)
    ),
    Restaurant(
        id: "restaurant5",
        name: "Weinkeller",
        locationString: "5633 Victoria Ave, Niagara Falls, ON",
        price: "$$",
        rating: "4.6",
        description: "Weinkeller offers a unique dining experience by combining a winery and restaurant under one roof. Guests can enjoy handcrafted wines produced on-site, paired with a menu that emphasizes fresh, locally sourced ingredients. The ambiance is warm and inviting, with rustic decor and attentive service. The restaurant's commitment to quality and innovation has made it a favorite among both wine enthusiasts and food lovers visiting Niagara Falls.",
        location: CLLocationCoordinate2D(latitude: 43.0912, longitude: -79.0785)
    ),
    Restaurant(
        id: "restaurant6",
        name: "Treadwell Cuisine",
        locationString: "114 Queen St, Niagara-on-the-Lake, ON",
        price: "$$$",
        rating: "4.8",
        description: "Located in the charming town of Niagara-on-the-Lake, Treadwell Cuisine is renowned for its dedication to farm-to-table dining. The restaurant collaborates closely with local farmers, artisans, and wineries to create dishes that showcase the region's bounty. The elegant yet relaxed atmosphere, combined with impeccable service, makes it a top choice for those seeking a refined culinary experience. The extensive wine list, featuring many local selections, complements the seasonal menu perfectly.",
        location: CLLocationCoordinate2D(latitude: 43.2554, longitude: -79.0716)
    ),
    Restaurant(
        id: "restaurant7",
        name: "The Keg Steakhouse + Bar - Fallsview",
        locationString: "6700 Fallsview Blvd, Niagara Falls, ON",
        price: "$$$",
        rating: "4.5",
        description: "The Keg Steakhouse + Bar - Fallsview offers a classic steakhouse experience with the added bonus of stunning views of Niagara Falls. Located within the Embassy Suites, the restaurant features floor-to-ceiling windows that provide a breathtaking backdrop to your meal. The menu includes a variety of premium steaks, seafood, and other favorites, all prepared with the quality and consistency The Keg is known for. The lively atmosphere and attentive service make it a popular spot for both tourists and locals.",
        location: CLLocationCoordinate2D(latitude: 43.0789, longitude: -79.0840)
    ),
    Restaurant(
        id: "restaurant8",
        name: "Massimo's Italian Fallsview Restaurant",
        locationString: "5875 Falls Ave, Niagara Falls, ON",
        price: "$$$",
        rating: "4.4",
        description: "Massimo's Italian Fallsview Restaurant, located within the Sheraton Fallsview Hotel, offers authentic Italian cuisine with a modern twist. Chef Massimo Capra brings his passion and expertise to a menu that features classic dishes made with fresh, high-quality ingredients. The restaurant's elegant setting and panoramic views of the falls create a memorable dining experience. Whether you're enjoying a romantic dinner or a family gathering, Massimo's delivers exceptional food and ambiance.",
        location: CLLocationCoordinate2D(latitude: 43.0907, longitude: -79.0716)
    ),
    Restaurant(
        id: "restaurant9",
        name: "Napoli Ristorante & Pizzeria",
        locationString: "5485 Ferry St, Niagara Falls, ON",
        price: "$$",
        rating: "4.6",
        description: "Napoli Ristorante & Pizzeria is a family-owned establishment that has been serving authentic Italian cuisine in Niagara Falls for decades. The cozy atmosphere, combined with a menu featuring traditional dishes and wood-fired pizzas, makes it a favorite among locals and visitors alike. The restaurant prides itself on using fresh ingredients and time-honored recipes to deliver a genuine taste of Italy. Friendly service and a welcoming environment ensure a delightful dining experience.",
        location: CLLocationCoordinate2D(latitude: 43.0895, longitude: -79.0820)
    ),
    Restaurant(
        id: "restaurant10",
        name: "Queen Charlotte Tea Room",
        locationString: "5689 Main St, Niagara Falls, ON",
        price: "$$",
        rating: "4.7",
        description: "Queen Charlotte Tea Room offers a charming British-style dining experience in the heart of Niagara Falls. The restaurant serves traditional English fare, including fish and chips, shepherd's pie, and an array of teas and desserts. The cozy, vintage-inspired decor and warm hospitality transport guests to a quaint English tearoom. Whether you're stopping in for a full meal or a classic afternoon tea, Queen Charlotte Tea Room provides a delightful and authentic experience.",
        location: CLLocationCoordinate2D(latitude: 43.0890, longitude: -79.0845)
    )
]

