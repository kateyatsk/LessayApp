import Foundation

struct WordDto: Codable {
    var word: String?
    var score: Int?
    var tags: [String] = []
}
