//
//  ResultViewController.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/17.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var RulesButton: UIButton!
    @IBOutlet weak var meButton: UIButton!
    @IBOutlet weak var houseButton: UIButton!
    @IBOutlet weak var emptyButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
   
    //Properties
    var delegate:Game?
    var chosen:String!
    var designModule = DesignsModule()
    var userDefaults = UserDefaults.standard
    var gameModule = GameModule()
    let list = ["paper","rock","scissors"]
    //random number generator from 0 to 2
    let rnd = Int.random(in: 0...2)
    var score:Int{
        //get score from UserDefaults
        get{
            return userDefaults.integer(forKey: "score")
        }
        // update score in userDefaults
        set{
            userDefaults.set(newValue, forKey: "score")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)"
        let houseChosen = list[rnd]
        initGameUI()
        resultUI(houseChosen)
    }
    
    //View Controller's UI initializer with user chosen
    private func initGameUI(){
        houseButton.isHidden = true;
        resultLabel.isHidden = true;
        designModule.shapeView(from: scoreView,borderWidth: 0, cornerRadius: 5)
        designModule.shapeView(from: topBarView, borderWidth: 1, cornerRadius: 5)
        designModule.shapeView(from: RulesButton, borderWidth: 1, cornerRadius: 5)
        designModule.setChosen(meButton, chosen)
    }
    
    private func resultUI(_ houseChosen:String){
        // setting timeInterval and setting result ui with result and calling updateScore() method to notify main UIController
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [self] timer in
            changeUI(with: houseChosen)
            guard let isWon = gameModule.calculateResult(chosen, houseChosen) else{
                self.playAgainButton.titleLabel?.text = "Play Again 😶"
                resultLabel.text = "DRAW"
                return
            }
            //user wins case
            if isWon{
                playAgainButton.titleLabel?.text = "Play Again 😀"
                resultLabel.text = "YOU WIN"
                score += 1
                self.scoreLabel.text = "\(score)"
                // updating user score inthe User defaults
                userDefaults.set(score, forKey: "score")
                //delegate method for notification
                delegate?.updateScore()
                
           }else{ //user lose case
               self.playAgainButton.titleLabel?.text = "Play Again 😞"
               resultLabel.text = "YOU LOSE"
           }
            
        }
    }
    // UI Updater with app choice
    private func changeUI(with houseChosen:String){
        houseButton.setImage(UIImage(named: "icon-\(houseChosen)"), for: .normal)
        houseButton.isHidden = false;
        emptyButton.isHidden = true;
        resultLabel.isHidden = false;
    }
    // if user wants to play again, change UI with main view controller UI
    @IBAction func playAgainPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
