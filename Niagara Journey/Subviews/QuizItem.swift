import SwiftUI

struct QuizItem: View {
    let quiz: Quiz
    let navigate: () -> Void
    
    var body: some View {
        HStack {
            Text(quiz.quizName)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            Button(action: {
                navigate()
            }) {
                Text("Start")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color("3A3A3A"))
                    .padding(8)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("FEC90D"))
                    )
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.1))
        )
    }
}
