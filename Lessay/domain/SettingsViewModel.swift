
    import SwiftUI

    class SettingsViewModel: ObservableObject {
        init() {
            startTimer()
        }

        @Published var progress = 60.0
        @Published var countTime = 60.0

        func subtractTime(amount: Double) {
            if progress > 10 {
                progress -= amount
                countTime -= amount
            }
          }
        
        func addTime(amount: Double) {
            if progress < 90 {
                progress += amount
                countTime += amount
            }
          }
        
        let timerInterval: TimeInterval = 1
        var timer: Timer?

        func startTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                progress -= self.timerInterval
                
                if progress <= 0 {
                    progress = 0
                    timer.invalidate()
                }
            }
        }
        
        func stopTimer() {
            timer?.invalidate()
            progress = countTime
        }
        
        func updateTimer() {

            progress = countTime
        }
        
    }

    


