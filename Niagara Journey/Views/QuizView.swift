import SwiftUI

struct QuizView: View {
    @ObservedObject var navigationViewModel = NavigationViewModel.shared
    
    let quiz: Quiz
    
    @State private var index = 0
    @State private var correctAnswers = 0
    @State private var selectedAnswer: String? = nil
    @State private var showFeedback = false
    @State private var isQuizCompleted = false
    
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
                
                Text(quiz.quizName)
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                
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
            
            if isQuizCompleted {
                VStack(spacing: 20) {
                    Spacer()
                    Text("Quiz Completed!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    Text("You got \(correctAnswers) out of \(quiz.questions.count) correct.")
                        .foregroundColor(.white)
                        .font(.title2)
                    
                    Button("Go Back") {
                        navigationViewModel.back()
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                }
                .padding()
            } else {
                ScrollView {
                    VStack(spacing: 24) {
                        Spacer()
                        
                        Text(quiz.questions[index].question)
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 16)
                        
                        ForEach(quiz.questions[index].answers, id: \.self) { answer in
                            Button(action: {
                                guard selectedAnswer == nil else { return }
                                selectedAnswer = answer
                                showFeedback = true
                                
                                if answer == quiz.questions[index].correctAnswer {
                                    correctAnswers += 1
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    if index + 1 < quiz.questions.count {
                                        index += 1
                                        selectedAnswer = nil
                                        showFeedback = false
                                    } else {
                                        isQuizCompleted = true
                                    }
                                }
                            }) {
                                Text(answer)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .medium))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(buttonColor(for: answer))
                                    )
                            }
                            .disabled(selectedAnswer != nil)
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func buttonColor(for answer: String) -> Color {
        guard let selected = selectedAnswer else {
            return Color.white.opacity(0.1)
        }
        if selected == answer {
            return answer == quiz.questions[index].correctAnswer ? Color.green.opacity(0.6) : Color.red.opacity(0.6)
        } else if showFeedback && answer == quiz.questions[index].correctAnswer {
            return Color.green.opacity(0.4)
        } else {
            return Color.white.opacity(0.1)
        }
    }
}
