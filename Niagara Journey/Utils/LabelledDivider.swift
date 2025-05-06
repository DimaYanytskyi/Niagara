import SwiftUI

struct LabelledDivider: View {
    let label: String
    let color: Color

    init(label: String, color: Color = .white.opacity(0.4)) {
        self.label = label
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label)
                .foregroundColor(color)
                .font(.system(size: 16, weight: .heavy))
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }
    }
}
