//
//  GameModule.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/17.
//

import Foundation

protocol Game:AnyObject{
    func updateScore()
}

class GameModule{
    
    var chosen:String = "paper"
   
    
    func setChoice( _ choice:String){
        self.chosen = choice
    }
    
    func getChosen() -> String {
        return chosen;
    }
    
    func calculateResult(_ me:String, _ machine:String)->Bool?{
        if me == machine{
            return nil
        }else if me == "paper" && machine == "rock" || me == "rock" && machine == "paper"{
            if me == "paper"{
                return true
            }
                return false
            
        }else if me == "paper" && machine == "scissors" || me == "scissors" && machine == "paper"{
            if machine == "scissors"{
                return false
            }
            return true
        }else if me == "rock" && machine == "scissors" || me == "scissors" && machine == "rock"{
            if machine == "rock"{
                return false
            }
            return true
        }
        
        return false
    }
    
}
