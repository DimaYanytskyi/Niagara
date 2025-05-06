import SwiftUI

struct InterestsButton : View {
    let name: String
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            HStack {
                Text(name)
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 24)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white.opacity(0.1))
            )
        }
    }
}
