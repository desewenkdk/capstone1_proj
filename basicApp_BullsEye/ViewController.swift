//
//  ViewController.swift
//  basicApp_BullsEye
//
//  Created by 김동규 on 26/03/2019.
//  Copyright © 2019 kdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //values must be declared global
    var targetLabelValue = 100
    var currentValue:Int = 50
    var score = 0
    var round = 0
    
    /*callback function of "Hit Me! button"*/
    @IBAction func hitButton(_ sender: UIButton) {
        
        let diff = abs(targetLabelValue - currentValue)
        
        /*
         prise is a dictionary, contains "earned point:title string"
         Swift's variables are all "Class-type"
         */
        let prise = generatePrise(diff:diff)
        /*
         i declared "var"type, to modify value.
         "let" type variable cannot be modified. it's immutable
         */
        var titleStr:String = ""
        for (point,title) in prise{
            score += point
            titleStr += title
        }
        
        print("diff:\(diff),earned:\(prise)")
        
        let message = "The slider:\(currentValue), score:\(score)"
        let alert = UIAlertController(title:titleStr, message: message, preferredStyle: .alert)
        
        /*
        UIAlertAction - ok, cancel, and else
        handler - next function to execute after do action OK, done, cancel, and etc...
         */
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {
            _ in self.startNewRound()
            
        })
        //add UIAlertAction to UIAlertController,
        alert.addAction(okAction)
        
        /*You should present alertView using "present" function, completion = handler*/
        present(alert,animated: true, completion:nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        print(slider.value)
        //slider.value has a float value range 0~1
        currentValue = lroundf(slider.value * 100)
        //for debug
        print("The value of slider is :\(currentValue)")
    }
    

    //make randomly target number
    func startNewRound(){
        targetLabelValue = Int.random(in: 1...100)
        round += 1
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    //update label text to updated values
    func updateLabels(){
        targetLabel.text = String(targetLabelValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    /*generate earned point, and praise comment, store to dictionary, and return.*/
    /*remember how to define
     function's parameter type and
     function's return type*/
    func generatePrise(diff: Int) -> Dictionary<Int,String>{
        var prise = [Int:String]()
        var title:String = ""
        var point:Int = 100 - diff
        if diff == 0{
            point += 100
            title = "Perfect!"
        }else if diff < 10{
            point += 50
            title = "Pretty Good!"
        }else{
            title = "Not even close"
        }
        
        prise[point] = title
        return prise
    }
}

