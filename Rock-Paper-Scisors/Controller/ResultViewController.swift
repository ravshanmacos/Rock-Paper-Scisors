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
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var chosen:String?
    var designModule = DesignsModule()
    
    var gameModule = GameModule()
    let list = ["paper","rock","scissors"]
    let rnd = Int.random(in: 0...2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        houseButton.isHidden = true;
        resultLabel.isHidden = true;
        designModule.shapeView(from: scoreView,borderWidth: 0, cornerRadius: 5)
        designModule.shapeView(from: topBarView, borderWidth: 1, cornerRadius: 5)
        designModule.shapeView(from: RulesButton, borderWidth: 1, cornerRadius: 5)

        if let chosen{
            let houseChosen = list[rnd]
            
            designModule.setChosen(meButton, chosen)
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.houseButton.setImage(UIImage(named: "icon-\(houseChosen)"), for: .normal)
                self.houseButton.isHidden = false;
                self.emptyButton.isHidden = true;
                self.resultLabel.text = self.gameModule.win(chosen, houseChosen)
                self.resultLabel.isHidden = false;
                if self.gameModule.win(chosen, houseChosen) == "YOU WIN"{
                self.playAgainButton.titleLabel?.text = "Play Again 😀"
                    self.score.text = self.gameModule.getScore()
               }else if self.gameModule.win(chosen, houseChosen) == "DRAW"{
                self.playAgainButton.titleLabel?.text = "Play Again 😶"
               }else{
                   self.playAgainButton.titleLabel?.text = "Play Again 😞"
               }
                
            }
          
            
            
        }
        
        
        
        
        
    }
    

    @IBAction func playAgainPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
