import UIKit

class ViewController: UIViewController 
{
    
    @IBOutlet weak var targetColorView: UIView!
    @IBOutlet weak var currentColorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var currentColorLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var targetColor: UIColor = UIColor.white
    var timer: Timer?
    var timeRemaining: Int = 30 //In Seconds
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        startNewRound()
        
    targetColorView.layer.borderWidth = 5
    targetColorView.layer.borderColor = UIColor.red.cgColor
    currentColorView.layer.borderWidth = 5
    currentColorView.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if timer == nil {
            startTimer()
        }
        updateCurrentColor()
    }
    
    func startNewRound() 
    {
        targetColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        targetColorView.backgroundColor = targetColor
        resetSliders()
        currentColorView.backgroundColor = UIColor.white
        timerLabel.text = "Time Remaining: 30"
        currentColorLabel.text = "R: 0, G: 0, B: 0"
        timer?.invalidate()
    }
    
    func resetSliders() 
    {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
    }
    
    func updateCurrentColor() 
    {
        let red = redSlider.value
        let green = greenSlider.value
        let blue = blueSlider.value
        currentColorView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        currentColorLabel.text = String(format: "R: %.2f, G: %.2f, B: %.2f", red, green, blue)
    }
    
    func startTimer() 
    {
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
    
    func updateTimerLabel() 
    {
        timerLabel.text = "Time Remaining: \(timeRemaining)"
    }
    
    func endGame() 
    {
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
    
}
