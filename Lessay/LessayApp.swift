import SwiftUI
import SwiftData

@main
struct LessayApp: App {
    @ObservedObject var gameViewModel = GameViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some Scene {
        WindowGroup {
            if gameViewModel.currentView == "FirstScreen" {
                FirstScreen(gameViewModel: gameViewModel, settingsVM: settingsVM)
            }
            else if gameViewModel.currentView == "GameScreen" {
                GameScreen(settingsVM: settingsVM, gameViewModel: gameViewModel)
            }
            else if gameViewModel.currentView == "RulesScreen" {
                RulesScreen(settingsVM: settingsVM, gameViewModel: gameViewModel)
            }
            else if gameViewModel.currentView == "ResultScreen" {
                ResultScreen(settingsVM: settingsVM, gameViewModel: gameViewModel)
            }
            else if gameViewModel.currentView == "SettingsScreen" {
                SettingsScreen(gameViewModel: gameViewModel, settingsVM: settingsVM)
            }
            else if gameViewModel.currentView == "CategoriesScreen" {
                CategoriesScreen(gameViewModel: gameViewModel, settingsVM: settingsVM)
            }
        }
    }
}
