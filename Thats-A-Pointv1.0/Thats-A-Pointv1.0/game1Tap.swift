//
//  game1Tap.swift
//  Thats-A-Pointv1.0
//
//  Created by Krueger, Ross L on 11/29/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

//
//  game1Tap.swift
//  thatsAPoint
//
//  Created by Krueger, Ross L on 11/28/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

import UIKit

class game1Tap: UIViewController {
    
    private let game1Title: UILabel
    private let button: UIImageView
    private let taps: UILabel
    private let timeLeft: UILabel
    private var score: Int
    private var gameTime: Int
    private var timer = Timer()
    private var nextGametime: Int
    
    
    init() {
        game1Title = UILabel()
        timeLeft = UILabel()
        button = UIImageView()
        taps = UILabel()
        score = 0
        gameTime = 10
        var timer = Timer()
        nextGametime = 3
        
        
        
        super.init(nibName: nil, bundle: nil)
        
        let screen: CGSize = UIScreen.main.bounds.size
        
        taps.text = ""
        taps.frame = CGRect(x: (screen.width/2), y:300, width: 200, height: 150)
        self.view.addSubview(taps)
        
        timeLeft.text = ""
        timeLeft.frame = CGRect(x: screen.width/2, y: 500, width: 200, height: 150)
        self.view.addSubview(timeLeft)
        
        game1Title.text = "TAP!"
        game1Title.frame = CGRect(x: (screen.width/2), y:0, width: 200, height: 150)
        self.view.addSubview(game1Title)
        
        button.image = UIImage(named: "red-button1.png")
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: (screen.width/2) - 150 , y : 100, width: 300, height:252)
        self.view.addSubview(button)
        
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(game1Tap.buttonTapper)))
        
        if gameTime == 10 {
            gameTimer()
        }
    }
    @objc func buttonTapper(_ recognizer: UITapGestureRecognizer) {
        if recognizer.numberOfTouches == 1 {
            if gameTime > 0 {
                score += 1
                taps.text = "\(score)"
            }
        }
    }
    
    func gameTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(game1Tap.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        gameTime -= 1
        timeLeft.text = "Time Left: " + "\(gameTime)"
        
        if gameTime == 0{
            timer.invalidate()
            goToNextGame()
        }
    }
    
    func goToNextGame(){
        if gameTime == 0 {
            let game2: game2Bounce = game2Bounce()
            game2.view.backgroundColor = UIColor.gray
            self.present(game2, animated: true) { () -> Void in
                
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func  viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
}


