import SwiftUI

struct PopularCard: View {
    let hotel: Hotel
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(hotel.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.white)
                    
                    Text(hotel.rating)
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .bold))
                }
                .padding(8)
            }
            
            Text(hotel.name)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
                .frame(width: 180)
                .lineLimit(1)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white.opacity(0.1))
        )
    }
}
