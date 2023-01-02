//
//  DesignsModule.swift
//  Rock-Paper-Scisors
//
//  Created by Ravshanbek Tursunbaev on 2022/10/17.
//


import UIKit

struct DesignsModule{
    
    func shapeView(from el:UIView,borderWidth:Int,cornerRadius:Int){
        el.layer.cornerRadius = CGFloat(cornerRadius);
        el.layer.borderWidth = CGFloat(borderWidth)
        el.layer.borderColor = UIColor.white.cgColor
    }

    func makeCirle(from view:UIView,color:String){
        view.layer.cornerRadius = 60;
        view.layer.borderWidth = 15;
        view.layer.borderColor = UIColor(named: color)?.cgColor
    }
    
    func setChosen(_ meButton:UIButton,_ chosen:String){
        switch chosen{
        case "paper":
            meButton.setImage(UIImage(named: "icon-paper"), for: .normal)
        case "scissors":
            meButton.setImage(UIImage(named: "icon-scissors"), for: .normal)
        case "rock":
            meButton.setImage(UIImage(named: "icon-rock"), for: .normal)
        default:
            meButton.setImage(UIImage(named: "icon-paper"), for: .normal)
        }
    }
}
