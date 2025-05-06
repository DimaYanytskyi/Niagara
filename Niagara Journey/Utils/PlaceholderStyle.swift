import SwiftUI

struct PlaceholderStyle: ViewModifier {
    var show: Bool
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .topLeading) {
            if show {
                Text(text)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(16)
            }
            content
                .foregroundColor(.white)
                .padding(16)
        }
    }
}
