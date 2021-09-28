//
//  ViewController.swift
//  test
//
//  Created by Hongfei Zheng on 9/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var s1Top: NSLayoutConstraint!
    @IBOutlet weak var s1Left: NSLayoutConstraint!
    @IBOutlet weak var s2Top: NSLayoutConstraint!
    @IBOutlet weak var s2Left: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            move(s1Top, -20)
        case 1:
            move(s1Left, 20)
        case 2:
            move(s1Top, 20)
        case 3:
            move(s1Left, -20)
        default:
            print("Invalid")
            
        }
    }
    //top 570
    //left 350
    func move(_ constraint: NSLayoutConstraint, _ distance: Int){
        
        UIView.animate(withDuration: 0.5) {
            constraint.constant = constraint.constant + CGFloat(distance)
            self.view.layoutIfNeeded()
        }
        if win(s1Left: s1Left, s1Top: s1Top, s2Left: s2Left, s2Top: s2Top){
            print("win")
            let top = Int.random(in: 0...570)
            let left = Int.random(in: 0...350)
            s2Top.constant = CGFloat(top)
            s2Left.constant = CGFloat(left)
        }
    }
    func win(s1Left: NSLayoutConstraint, s1Top: NSLayoutConstraint, s2Left: NSLayoutConstraint, s2Top: NSLayoutConstraint) -> Bool{
        let condition1 = abs(Int(s1Left.constant - s2Left.constant)) < 50
        let condition2 = abs(Int(s1Top.constant - s2Top.constant)) < 50
        if (condition1 && condition2){
            return true
        }
        return false
    }
    
}

