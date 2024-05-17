
import SwiftUI


struct FirstScreen: View {
    @StateObject var gameViewModel: GameViewModel

    @StateObject var settingsVM: SettingsViewModel
    var body: some View {
        NavigationView {
            ZStack{
                let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("CircleWhite")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .padding(.trailing, 187)
                    
                    Text("Welcome to Lessay!")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Bold", size: 28))
                        .frame(width: 248, height: 92)
                        .bold()
                    
                    Image("Question")
                        .resizable()
                        .frame(width: 380, height: 243)
                    Spacer()
                    
                    Button(action: {
                        gameViewModel.currentView = "RulesScreen"
                    }) {
                        Text("Start")
                            .frame(width: 199, height: 80)
                            .background(Color.onPrimaryVariant)
                            .cornerRadius(36)
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Medium", size: 20))
                            .padding(.bottom, 40)
                            .shadow(color: Color.orange.opacity(0.8), radius: 10, x: 0, y: 5)
                    }

                }
              
            }.navigationBarItems(trailing: Button(action: {
                gameViewModel.currentView = "SettingsScreen"
            }){
                Image("Settings")
                    .resizable()
                    .frame(width: 26, height: 26)
            })
        }.preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
       
    }
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("-- \(fontName)")
//            }
//
//        }
//    }
}

