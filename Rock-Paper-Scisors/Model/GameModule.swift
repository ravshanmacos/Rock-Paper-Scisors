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
    var score = 0;
    
    func setChoice( _ choice:String){
        self.chosen = choice
    }
    
    func getChosen() -> String {
        return chosen;
    }
    
    func win(_ me:String, _ machine:String)->String{
        if me == machine{
            return "DRAW"
        }else if me == "paper" && machine == "rock" || me == "rock" && machine == "paper"{
            if me == "paper"{
                score += 1;
                return "YOU WIN"
                
            }
                return "YOU LOSE"
            
        }else if me == "paper" && machine == "scissors" || me == "scissors" && machine == "paper"{
            if machine == "scissors"{
                return "YOU LOSE"
            }
            score += 1;
            return "YOU WIN"
        }else if me == "rock" && machine == "scissors" || me == "scissors" && machine == "rock"{
            if machine == "rock"{
                return "YOU LOSE"
            }
            score += 1;
            return "YOU WIN"
        }
        
        return ""
    }
    
    
    func getScore() -> String{
        return "\(score)"
    }
    
}

/**
 paper beat rock
 rock beat scissor
 scissor beat paper
 
 func calculate(){
 
 el1, el2
 
 }
 
 */
