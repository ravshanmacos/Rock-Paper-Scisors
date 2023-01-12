//
//  GameModule.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/17.
//

import Foundation

//Game protocol
protocol Game:AnyObject{
    func updateScore()
}

class GameModule{
    
    var chosen:String = "paper"
   
    // set user choice
    func setChoice( _ choice:String){
        self.chosen = choice
    }
    //get user choice
    func getChosen() -> String {
        return chosen;
    }

    func calculateResult(_ me:String, _ machine:String)->Bool?{
        //retur nil if result is DRAW
        if me == machine{
            return nil
        }else if me == "paper" && machine == "rock" || me == "rock" && machine == "paper"{ // if user choice is paper and machine choice rock, user wins, otherwise user loose
            if me == "paper"{
                return true
            }
                return false
            
        }else if me == "paper" && machine == "scissors" || me == "scissors" && machine == "paper"{// if user choice is paper and machine choice scissors, user user loose, otherwise user wins
            if me == "paper"{
                return false
            }
            return true
        }else if me == "rock" && machine == "scissors" || me == "scissors" && machine == "rock"{// if user choice is rock and machine choice scissors, user wins, otherwise user loose
            if me == "rock"{
                return true
            }
            return false
        }
        
        return false
    }
    
}
