import SwiftUI


struct SettingsScreen: View {
    @StateObject var gameViewModel: GameViewModel
    @StateObject var settingsVM : SettingsViewModel
    @State private var punishmentOn = true
    
    
    var body: some View{
        NavigationView {
            ZStack{
                let backgroundGradient = LinearGradient(gradient: Gradient(colors: [.backgroundAccent, .backgroundSecondary]), startPoint: .top, endPoint: .bottom)
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Round Length")
                        .font(.custom("Poppins-Bold", size: 26))
                        .foregroundColor(.white)
                    HStack(alignment: .center, spacing: 20) {
                            Button {
                                settingsVM.subtractTime(amount: 10)
                            } label:{
                                ZStack{
                                    Image(settingsVM.progress <= 10 ? "GrayCircle" : "Circle")
                                        .resizable()
                                        .frame(width: 37 , height: 37)
                                        .padding(.bottom, 15)
                                        .shadow(color: Color.orange.opacity(0.5), radius: 10, x: 0, y: 6)
                                    Text("-")
                                        .foregroundColor(.white)
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .padding(.bottom, 15)
                                }
                                    .padding(.bottom, 10)
                            }.disabled(settingsVM.progress <= 10)
                            ZStack{
                                Image("Polygon")
                                    .resizable()
                                    .frame(width: 80 , height: 85)
                                    .padding(.bottom, 30)
                                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 6)
                                Text("\(Int(settingsVM.progress))")
                                    .font(.custom("Poppins-ExtraBold", size: 36))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 30)
                                
                            }
                            Button {
                                settingsVM.addTime(amount: 10)
                            } label: {
                                ZStack{
                                    Image(settingsVM.progress >= 90 ? "GrayCircle" : "Circle")
                                        .resizable()
                                        .frame(width: 37 , height: 37)
                                        .padding(.bottom, 15)
                                        .shadow(color: Color.orange.opacity(0.5), radius: 10, x: 0, y: 6)
                                    Text("+")
                                        .foregroundColor(.white)
                                        .font(.custom("Poppins-Bold", size: 20))
                                        .padding(.bottom, 15)
                                }
                                    .padding(.bottom, 10)
                            }
                            .disabled(settingsVM.progress >= 90)
                    }
                    VStack(alignment: .leading) {
                        Toggle("Punishment", isOn: $gameViewModel.punishment)
                            .font(.custom("Poppins-Bold", size: 26))
                            .foregroundColor(.white)
                            .toggleStyle(SwitchToggleStyle(tint: .onPrimaryVariant))
                        
                        Text("One point is deducted for each incorrect answer.")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 14))
                        
                    }.frame(width: 310)
                    
                        
                }.padding(.bottom, 350)
                }.navigationBarItems(
                    leading: Button(action: {gameViewModel.currentView = "FirstScreen"}) {
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
                )
            }.preferredColorScheme(.dark)
            .navigationBarBackButtonHidden()
            .onAppear {
                
                settingsVM.stopTimer()
            }
        }
        
    }
    
