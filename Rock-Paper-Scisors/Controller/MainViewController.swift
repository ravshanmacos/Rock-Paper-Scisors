//
//  ViewController.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/15.
//

import UIKit

class MainViewController: UIViewController, Game {
   
   //MARK: - Outlets
    
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var RulesButton: UIButton!
    @IBOutlet weak var resultView: UILabel!
    var designsModule = DesignsModule()
    var gameModule = GameModule()
    var userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.set(0, forKey: "score")
        designsModule.shapeView(from: scoreView,borderWidth: 0, cornerRadius: 5)
        designsModule.shapeView(from: topBarView, borderWidth: 1, cornerRadius: 5)
        designsModule.shapeView(from: RulesButton, borderWidth: 1, cornerRadius: 5)
        
    }
    
    //MARK: - IBActions Functions
    
    
    @IBAction func whenChosen(_ sender: UIButton) {
        if let chosen = sender.titleLabel!.text{
            gameModule.setChoice(chosen)
            performSegue(withIdentifier: "mainToPlay", sender: self)
        }
        
        }
    
    func updateScore() {
        resultView.text = String(userDefaults.integer(forKey: "score"))
    }
    
    
}


extension MainViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToPlay"{
            let destinationVC =  segue.destination as! ResultViewController
            destinationVC.chosen = gameModule.getChosen()
            destinationVC.delegate = self
        }
    }
}
