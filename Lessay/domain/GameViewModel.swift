import SwiftUI
import Alamofire
import Combine

class GameViewModel: ObservableObject {
    @Published var currentWord: String = ""
    @Published var guessedWords: [String] = []

    @Published var score: Int = 0
    
    @Published var category = ""
    
    @Published var punishment: Bool = true
    
    @Published var currentView = "FirstScreen"

    private func getUrl() -> String {
        return "https://api.datamuse.com/words?ml=\(category)&p=n&v=en"
    }
    
    func fetchWord() {
        guard let url = URL(string: getUrl()) else {
            print("Invalid URL")
            return
        }
        
        AF.request(url).validate().responseDecodable(of: [WordDto].self) { response in
            switch response.result {
            case .success(let wordDto):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    if let word = wordDto.randomElement()?.word {
                        if self.guessedWords.contains(word) {
                            self.fetchWord()
                        } else {
                            self.currentWord = word
                            self.guessedWords.append(word)
                        }
                    }
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
    
    func handleCorrectAnswer() {
        score += 1
    }
    
    func handleNotCorrectAnswer() {
        if punishment {
            score -= 1
        }
    }
}
