//
//  ResultViewController.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/17.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var RulesButton: UIButton!
    @IBOutlet weak var meButton: UIButton!
    @IBOutlet weak var houseButton: UIButton!
    @IBOutlet weak var emptyButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
   
    var delegate:Game?
    var chosen:String!
    var designModule = DesignsModule()
    var userDefaults = UserDefaults.standard
    var gameModule = GameModule()
    let list = ["paper","rock","scissors"]
    let rnd = Int.random(in: 0...2)
    var score:Int{
        get{
            return userDefaults.integer(forKey: "score")
        }
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
    
    private func initGameUI(){
        houseButton.isHidden = true;
        resultLabel.isHidden = true;
        designModule.shapeView(from: scoreView,borderWidth: 0, cornerRadius: 5)
        designModule.shapeView(from: topBarView, borderWidth: 1, cornerRadius: 5)
        designModule.shapeView(from: RulesButton, borderWidth: 1, cornerRadius: 5)
        designModule.setChosen(meButton, chosen)
    }
    
    private func resultUI(_ houseChosen:String){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [self] timer in
            changeUI(with: houseChosen)
            guard let isWon = gameModule.calculateResult(chosen, houseChosen) else{
                self.playAgainButton.titleLabel?.text = "Play Again 😶"
                resultLabel.text = "DRAW"
                return
            }
            if isWon{
                playAgainButton.titleLabel?.text = "Play Again 😀"
                resultLabel.text = "YOU WIN"
                score += 1
                self.scoreLabel.text = "\(score)"
                userDefaults.set(score, forKey: "score")
                delegate?.updateScore()
                
           }else{
               self.playAgainButton.titleLabel?.text = "Play Again 😞"
               resultLabel.text = "YOU LOSE"
           }
            
        }
    }
    
    private func changeUI(with houseChosen:String){
        houseButton.setImage(UIImage(named: "icon-\(houseChosen)"), for: .normal)
        houseButton.isHidden = false;
        emptyButton.isHidden = true;
        resultLabel.isHidden = false;
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
