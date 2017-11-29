//
//  game2Bouce.swift
//  Thats-A-Pointv1.0
//
//  Created by Krueger, Ross L on 11/29/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

//
//  game2Bounce.swift
//  thatsAPoint
//
//  Created by Krueger, Ross L on 11/28/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

import UIKit

class game2Bounce: UIViewController {
    private let game2Title: UILabel
    private let bounceButton: UIButton
    private let ball: UIImageView
    private var bounceSpeed: Double
    private let beginButton: UIButton
    private let score: UILabel
    private var numberOfBounces: Int
    
    init() {
        
        game2Title = UILabel()
        bounceButton = UIButton()
        beginButton = UIButton()
        ball = UIImageView()
        bounceSpeed = 1.5
        score = UILabel()
        numberOfBounces = 0
        
        super.init(nibName: nil, bundle: nil)
        
        let screen: CGSize = UIScreen.main.bounds.size
        
        game2Title.text = "BOUNCE!"
        game2Title.frame = CGRect(x: 325, y:0, width: 200, height: 150)
        self.view.addSubview(game2Title)
        
        score.text = "Score: "
        score.frame = CGRect(x: 325, y: 200, width: 200, height: 150)
        self.view.addSubview(score)
        
        ball.image = UIImage(named: "ball.png")
        ball.isUserInteractionEnabled = true
        ball.frame = CGRect(x: (screen.width / 2) - 50, y: 75, width: 100, height: 100)
        self.view.addSubview(ball)
        
        
        bounceButton.frame = CGRect(x: 0, y: screen.height - 200, width: screen.width, height: 100)
        bounceButton.backgroundColor = UIColor.white
        bounceButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(game2Bounce.bounceButtonPressed(_:))))
        bounceButton.isEnabled = true
        bounceButton.setTitle("Bounce", for: UIControlState.normal)
        self.view.addSubview(bounceButton)
        
        
        beginButton.frame = CGRect(x: (screen.width/2) - 50, y: screen.height - 50, width: 100, height: 50)
        beginButton.backgroundColor = UIColor.blue
        beginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(game2Bounce.dropBall(_:))))
        beginButton.isEnabled = true
        beginButton.setTitle("Begin", for: UIControlState.normal)
        self.view.addSubview(beginButton)
        
        
    }
    
    @objc func bounceButtonPressed(_ recognizer: UITapGestureRecognizer) {
        let screen: CGSize = UIScreen.main.bounds.size
        if recognizer.numberOfTouches == 1 && ball.center.y >= screen.height - 200 && ball.center.y <= screen.height - 150 {
            
            numberOfBounces += 1
            ballCycle()
            
            bounceSpeed -= 0.1
            
            score.text = "Score: " + "\(numberOfBounces)"
            
            
        } else {
            print("Not in time")
            goToNextGame()
        }
    }
    
    @objc func dropBall(_ recognizer: UITapGestureRecognizer){
        let screen: CGSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: bounceSpeed, animations: {
            () -> Void in
            self.ball.center.y = screen.height - 200
        }, completion: nil)
        beginButton.isUserInteractionEnabled = false
    }
    
    func ballCycle() {
        let screen: CGSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: self.bounceSpeed, animations: {
            () -> Void in
            self.ball.center.y = 75
        }, completion: {
            (Bool) -> Void in
            UIView.animate(withDuration: self.bounceSpeed, animations: {
                () -> Void in
                self.ball.center.y = screen.height - 149
            }, completion: {
                (Bool) -> Void in
            })
        })
    }
    func goToNextGame(){
        let game1: game1Tap = game1Tap()
        game1.view.backgroundColor = UIColor.gray
        self.present(game1, animated: true) { () -> Void in
            
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

