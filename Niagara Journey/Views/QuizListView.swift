import SwiftUI

struct QuizListView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
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
                
                Text("Quizes")
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
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(quizes, id: \.self) { quiz in
                        QuizItem(quiz: quiz) {
                            navigationViewModel.navigate(to: .quiz(quiz))
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    QuizListView()
        .background(Color("206E49").ignoresSafeArea(.all))
}
