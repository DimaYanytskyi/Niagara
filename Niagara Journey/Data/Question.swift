import Foundation

struct Question : Codable, Hashable {
    let question: String
    let answers: [String]
    let correctAnswer: String
}

