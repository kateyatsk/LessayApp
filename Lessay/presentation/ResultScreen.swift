
import SwiftUI

struct ResultScreen: View {
    @StateObject var settingsVM : SettingsViewModel
    @StateObject var gameViewModel: GameViewModel

    var body: some View {
        NavigationView {
            ZStack{
                let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Nice work")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Bold", size: 28))
                    ZStack{
                        Image("Check")
                            .resizable()
                            .frame(width: 240, height: 240)
                        
                        HStack{
                            Image(gameViewModel.score > 1 ? "StarFill" : "Star")
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            Image(gameViewModel.score > 5 ? "StarFill" : "Star")
                                .resizable()
                                .frame(width: 52, height: 52)
                            
                            Image(gameViewModel.score > 10 ? "StarFill" : "Star")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }.padding(.top, 240)
                    }
                    Text("You Earned \(gameViewModel.score) pts")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(.white)
                    
                    VStack{
                        Button(action: {
                            gameViewModel.currentView = "FirstScreen"
                        }) {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                                    .fill(Color.clear)
                                    .frame(width: 327, height: 64)
                                    .shadow(color: Color.white.opacity(0.8), radius: 10, x: 0, y: 5)
                                    .overlay(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).stroke(Color.white, lineWidth: 2))
                                    
                                Text("Back to main")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    
                            }
                        }
                        Button(action: {
                            gameViewModel.currentView = "CategoriesScreen"
                        }) {
                            Text("Play Again")
                                .frame(width: 327, height: 64)
                                .background(Color.onPrimaryVariant)
                                .cornerRadius(12)
                                .foregroundColor(.white)
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                        }
                    }.padding(.top,50)
                    
                }
            }.preferredColorScheme(.dark)
        }.navigationBarBackButtonHidden()
    }
}

