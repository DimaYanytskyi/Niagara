import SwiftUI
import MapKit
import CoreLocation

struct RestaurantMapView : View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.0896, longitude: -79.0849),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var selected: Restaurant? = nil
    
    var body : some View {
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
                
                Text("Restaurants")
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
            .padding()
            
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $region, annotationItems: restaurants) { restaurant in
                    MapAnnotation(coordinate: restaurant.location) {
                        Button(action: {
                            withAnimation {
                                selected = restaurant
                            }
                        }) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(selected?.id == restaurant.id ? .blue : .red)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                if let restaurant = selected {
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
                            .fill(Color("206E49"))
                    )
                    .padding()
                    .cornerRadius(8)
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RestaurantMapView()
        .background(Color("206E49").ignoresSafeArea(.all))
}

