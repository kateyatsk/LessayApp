import SwiftUI

struct RulesScreen: View {

    @StateObject var settingsVM : SettingsViewModel
    @StateObject var gameViewModel: GameViewModel
    var body: some View {
        NavigationView {
            ZStack {
                let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        Image("Swords")
                            .resizable()
                            .frame(width: 390, height: 490)
                            .padding(.bottom, 626)
                        
                        Text("RULES")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-ExtraBold", size: 32))
                            .padding(.bottom, 400)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 327, height: 319)
                                .cornerRadius(40)
                                .shadow(color: Color.black.opacity(0.8), radius: 10, x: 0, y: 5)
                            
                            VStack(alignment: .center) {
                                ZStack {
                                    Text("Guess words")
                                        .font(.custom("Poppins-Bold", size: 28))
                                        .foregroundColor(.onSurface)
                                        .padding(.bottom, 215)
                                    
                                    Text("This game can be played by 2 or more people. The player (or a team of players) picks up the phone, selects a category and begins to explain the words that appear on the screen without using the same root, the rest of the players try to guess the words. The one who can explain more words will win. Play with pleasure and enjoy the game «Lessay»!")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.primaryVariant)
                                        .frame(width: 270, height: 210)
                                        .lineSpacing(6.0)
                                        .padding(.top, 45)
                                }.padding(.bottom, 35)
                            }
                            Button(action: {
                                gameViewModel.currentView = "CategoriesScreen"
                                settingsVM.startTimer()
                            }){
                                ZStack {
                                    Circle()
                                        .fill(Color.onPrimaryVariant)
                                        .frame(width: 80, height: 80)
                                    
                                    Image("ArrowRight")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                }.padding(.top, 305)
                            }
                        }
                    }
                    .padding(.top, 300)
                }
            }
            .navigationBarItems(
                trailing: Button(action: {
                    gameViewModel.currentView = "FirstScreen"
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
                    .padding(.trailing, 380)
                    .padding(.top, 10)
                }
            ).preferredColorScheme(.dark)
        }.onAppear(){
            settingsVM.stopTimer()
            gameViewModel.score = 0
        }
        .navigationBarBackButtonHidden(true)
    
    }
}
