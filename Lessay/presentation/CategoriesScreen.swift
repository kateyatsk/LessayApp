import SwiftUI


struct CategoriesScreen: View {
    @StateObject var gameViewModel: GameViewModel
    @StateObject var settingsVM: SettingsViewModel

    var body: some View {
        NavigationView {
            ZStack {
                let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Categories")
                        .font(.custom("Poppins-Medium", size: 20))
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            gameViewModel.currentView = "GameScreen"
                            gameViewModel.category = "animal"
                            settingsVM.updateTimer()
                            settingsVM.startTimer()
                            gameViewModel.score = 0
                        }) {
                            CategoryRow(imageName: "Animal", categoryName: "Animals")
                        }
                        
                        Button(action: {
                            gameViewModel.currentView = "GameScreen"
                            gameViewModel.category = "food"
                            settingsVM.updateTimer()
                            settingsVM.startTimer()
                            gameViewModel.score = 0
                        }) {
                            CategoryRow(imageName: "Food", categoryName: "Food")
                        }
                        
                        Button(action: {
                            gameViewModel.currentView = "GameScreen"
                            gameViewModel.category = "transport"
                            settingsVM.updateTimer()
                            settingsVM.startTimer()
                            gameViewModel.score = 0
                        }) {
                            CategoryRow(imageName: "Transport", categoryName: "Transport")
                        }
                            
                        Button(action: {
                            gameViewModel.currentView = "GameScreen"
                            gameViewModel.category = "sports"
                            settingsVM.updateTimer()
                            settingsVM.startTimer()
                            gameViewModel.score = 0
                        }) {
                            CategoryRow(imageName: "Sports", categoryName: "Sports")
                        }
                           
                        Button(action: {
                            gameViewModel.currentView = "GameScreen"
                            gameViewModel.category = "clothes"
                            settingsVM.updateTimer()
                            settingsVM.startTimer()
                            gameViewModel.score = 0
                        }) {
                            CategoryRow(imageName: "Clothes", categoryName: "Clothes")
                        }
                    }
                }
                .padding(.bottom, 100)
            }
            .navigationBarItems(
                leading: Button(action: {
                    gameViewModel.currentView = "RulesScreen"
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .foregroundColor(Color.white.opacity(0.4))
                            .frame(width: 106, height: 65)
                        Image("Arrow")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.leading, 40)
                    }
                    .padding(.trailing, 360)
                    .padding(.top, 10)
                }
            ).preferredColorScheme(.dark)
        }  .navigationBarBackButtonHidden()
    }
}


struct CategoryRow: View {
    let imageName: String
    let categoryName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill()
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(width: 338, height: 80)
                .shadow(color: Color.white.opacity(0.8), radius: 10, x: 0, y: 5)
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(categoryName)
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .foregroundColor(.onPrimary)
            }
        }
    }
}
