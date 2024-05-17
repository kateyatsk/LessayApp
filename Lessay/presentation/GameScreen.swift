import SwiftUI

struct GameScreen: View {
    @StateObject var settingsVM: SettingsViewModel
    @StateObject var gameViewModel: GameViewModel
    @State private var showResultScreen = false
    @State private var highlightColor: Color? = nil

    var body: some View {
        if settingsVM.progress <= 0 {
            ResultScreen(settingsVM: settingsVM, gameViewModel: gameViewModel)
        } else {
            NavigationView {
                ZStack {
                    let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                    backgroundGradient
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text("\(Int(settingsVM.progress))")
                                    .font(Font.custom("Poppins-ExtraBold", size: 48))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(width: 120)
                            
                            Text("seconds")
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-ExtraBold", size: 24))
                                .fontWeight(.bold)
                            
                            ProgressView(value: settingsVM.progress, total: settingsVM.countTime)
                                .progressViewStyle(LinearProgressViewStyle(tint: .onPrimaryVariant))
                                .frame(width: 300)
                                .padding()
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(highlightColor ?? Color.white)
                                .frame(width: 327, height: 275)
                                .shadow(color: Color.white.opacity(0.8), radius: 10, x: 0, y: 5)
                            ZStack {
                                Rectangle()
                                    .fill(Color.onPrimaryVariant)
                                    .frame(width: 120, height: 41)
                                    .cornerRadius(12)
                                Text("\(gameViewModel.score)pts")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Bold", size: 20))
                            }
                            .padding(.bottom, 270)
                            
                            Text(gameViewModel.currentWord)
                                .font(.custom("Poppins-Bold", size: 28))
                                .foregroundStyle(Color.onPrimary)
                        }
                        
                        VStack {
                            Button(action: {
                                highlightColor = .red.opacity(0.8)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        highlightColor = nil
                                        gameViewModel.handleNotCorrectAnswer()
                                        gameViewModel.fetchWord()
                                    }
                                }
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                                        .fill(Color.clear)
                                        .frame(width: 327, height: 64)
                                        .overlay(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).stroke(Color.white, lineWidth: 2))
                                    
                                    Text("Skip")
                                        .foregroundColor(.white)
                                        .font(.custom("Poppins-SemiBold", size: 18))
                                }
                            }
                            
                            Button(action: {
                                highlightColor = .green.opacity(0.8)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        highlightColor = nil
                                        gameViewModel.handleCorrectAnswer()
                                        gameViewModel.fetchWord()
                                    }
                                }
                            }) {
                                Text("Correct")
                                    .frame(width: 327, height: 64)
                                    .background(Color.onPrimaryVariant)
                                    .cornerRadius(12)
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                            }
                        }
                        
                        Spacer()
                    }
                }
                .navigationBarItems(
                    leading: Button(action: {gameViewModel.currentView = "RulesScreen"}) {
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
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                gameViewModel.fetchWord()
            }
            .fullScreenCover(isPresented: $showResultScreen) {
                ResultScreen(settingsVM: settingsVM, gameViewModel: gameViewModel)
            }
        }
    }
}
