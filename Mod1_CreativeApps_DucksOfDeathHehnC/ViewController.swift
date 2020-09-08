//
//  ViewController.swift
//  Mod1_CreativeApps_DucksOfDeathHehnC
//
//  Created by Tiger Coder on 9/4/20.
//  Copyright © 2020 clc.hehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clickerImageOutlet: UIButton!
    @IBOutlet weak var whiteDuckImageOutlet: UIButton!
    @IBOutlet weak var greenDuckImageOutlet: UIButton!
    @IBOutlet weak var chooseYourDuckTextOutlet: UILabel!
    @IBOutlet weak var showGIFOutlet: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    let whiteDuck = UIImage(named: "duck")
    let greenDuck = UIImage(named: "duck2")
    
    var highScoreText = "High Score: "
    var highScoreNumber = 0
    
    var scoreText = "Score: "
    var scoreNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clickerImageOutlet.isHidden = true
    }
    
    @IBAction func whiteDuckClick(_ sender: UIButton) {
        chooseYourDuckTextOutlet.isHidden = true
        whiteDuckImageOutlet.isHidden = true
        greenDuckImageOutlet.isHidden = true
        
        clickerImageOutlet.isHidden = false
        
        clickerImageOutlet.setImage(whiteDuck, for: .normal)
    }
    
    @IBAction func greenDuckClick(_ sender: UIButton) {
        chooseYourDuckTextOutlet.isHidden = true
        whiteDuckImageOutlet.isHidden = true
        greenDuckImageOutlet.isHidden = true
        
        clickerImageOutlet.isHidden = false
        
        clickerImageOutlet.setImage(greenDuck, for: .normal)
    }
    
    @IBAction func duckClick(_ sender: UIButton) {
        scoreNumber = scoreNumber + 1
        if (scoreNumber > highScoreNumber){
            highScoreNumber = scoreNumber
        }
        
        scoreLabel.text = "Score: \(scoreNumber)"
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        
        let randNum = Int.random(in: 0...10)
        if (randNum == 0 || randNum == 10){
            
            showGIFOutlet.loadGif(name: "duckexplode")
            showGIFOutlet.isHidden = false
            
            scoreNumber = 0
            scoreLabel.text = "Score: \(scoreNumber)"
            
            gameOverSheet()
        }
    }
    
    @IBAction func gameOverSheet() {
    
       let defaultAction = UIAlertAction(title: "OK", style: .default) { (action) in
        
        self.showGIFOutlet.isHidden = true
        self.clickerImageOutlet.isHidden = true
                      
        self.chooseYourDuckTextOutlet.isHidden = false
        self.whiteDuckImageOutlet.isHidden = false
        self.greenDuckImageOutlet.isHidden = false
       }

       let gameOver = UIAlertController(title: "BOOM!", message: "The Duck Exploded! Game over, man.", preferredStyle: .actionSheet)
       gameOver.addAction(defaultAction)
            
       self.present(gameOver, animated: true) {
       }
    }

}

