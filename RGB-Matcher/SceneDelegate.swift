//
//  SceneDelegate.swift
//  RGB-Matcher
//
//  Created by Narayanan, Sai Navneedh on 10/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


    /*
     func startNewRound() {
         targetColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
         targetColorView.backgroundColor = targetColor
         resetSliders()
         currentColorView.backgroundColor = UIColor.white
         timerLabel.text = "Time Remaining: 30"
         currentColorLabel.text = "R: 0, G: 0, B: 0"
         timer?.invalidate()
     }
     
     func resetSliders() {
         redSlider.value = 0
         greenSlider.value = 0
         blueSlider.value = 0
     }
     
     func updateCurrentColor() {
         let red = redSlider.value
         let green = greenSlider.value
         let blue = blueSlider.value
         currentColorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
         currentColorLabel.text = String(format: "R: %.2f, G: %.2f, B: %.2f", red, green, blue)
     }
     
     func startTimer() {
         timeRemaining = 30
         timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
             guard let self = self else { return }
             self.timeRemaining -= 1
             self.updateTimerLabel()
             if self.timeRemaining == 0 {
                 timer.invalidate()
                 self.endGame()
             }
         }
     }
     
     func updateTimerLabel() {
         timerLabel.text = "Time Remaining: \(timeRemaining)"
     }
     
     func endGame() {
         timer?.invalidate()
         let targetRGB = extractRGB(from: targetColor)
         let currentRGB = extractRGB(from: currentColorView.backgroundColor ?? UIColor.white)
         let score = calculateScore(targetRGB: targetRGB, currentRGB: currentRGB)
         showAlert(withScore: score)
     }
     
     func calculateScore(targetRGB: (CGFloat, CGFloat, CGFloat), currentRGB: (CGFloat, CGFloat, CGFloat)) -> Int {
         let rDiff = targetRGB.0 - currentRGB.0
         let gDiff = targetRGB.1 - currentRGB.1
         let bDiff = targetRGB.2 - currentRGB.2
         let distance = sqrt(pow(rDiff, 2) + pow(gDiff, 2) + pow(bDiff, 2))
         return Int((1 - distance) * 100)
     }
     
     func extractRGB(from color: UIColor) -> (CGFloat, CGFloat, CGFloat) {
         var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
         color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
         return (red, green, blue)
     }
     
     func showAlert(withScore score: Int) {
         let alert = UIAlertController(title: "Game Over", message: "Your Score: \(score)", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
             self.startNewRound()
         })
         present(alert, animated: true)
     }
     */
}

