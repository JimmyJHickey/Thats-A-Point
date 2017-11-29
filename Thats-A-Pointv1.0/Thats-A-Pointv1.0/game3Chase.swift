//
//  game3Chase.swift
//  Thats-A-Pointv1.0
//
//  Created by Krueger, Ross L on 11/29/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

//
//  game3Chase.swift
//  thatsAPoint
//
//  Created by Krueger, Ross L on 11/29/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

import UIKit

class game3Chase: UIViewController {
    private let game3Title: UILabel
    private let playerToken: UIImageView
    private let gate1: UIButton
    private let gate2: UIButton
    private let gate3: UIButton
    private let gate4: UIButton
    private let finish: UIButton
    private var timer = Timer()
    private var gameTime: Double
    private let timeLeft: UILabel
    
    
    init() {
        
        let screen: CGSize = UIScreen.main.bounds.size
        game3Title = UILabel()
        playerToken = UIImageView()
        gate1 = UIButton()
        gate2 = UIButton()
        gate3 = UIButton()
        gate4 = UIButton()
        finish = UIButton()
        gameTime = 0.0
        timeLeft = UILabel()
        
        super.init(nibName: nil, bundle: nil)
        
        timeLeft.text = ""
        timeLeft.frame = CGRect(x: screen.width/2 - 200, y: 25, width: 100, height: 100)
        self.view.addSubview(timeLeft)
        
        playerToken.image = UIImage(named: "playerToken.png")
        playerToken.isUserInteractionEnabled = true
        playerToken.frame = CGRect(x: screen.width/2, y: screen.height - 100, width: 50, height: 50)
        playerToken.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(game3Chase.movePlayer)))
        self.view.addSubview(playerToken)
        
        gate1.isUserInteractionEnabled = false
        gate1.backgroundColor = UIColor.black
        gate1.frame = CGRect(x: (screen.width/2) - 100, y: screen.height - 200, width: screen.width - 100, height: 50)
        self.view.addSubview(gate1)
        
        gate2.isUserInteractionEnabled = false
        gate2.backgroundColor = UIColor.black
        gate2.frame = CGRect(x: 0, y: screen.height - 350, width: screen.width - 100, height: 50)
        self.view.addSubview(gate2)
        
        gate3.isUserInteractionEnabled = false
        gate3.backgroundColor = UIColor.black
        gate3.frame = CGRect(x: (screen.width/2) - 100, y: screen.height - 500, width: screen.width - 100, height: 50)
        self.view.addSubview(gate3)
        
        gate4.isUserInteractionEnabled = false
        gate4.backgroundColor = UIColor.black
        gate4.frame = CGRect(x: 0, y: screen.height - 350, width: screen.width - 100, height: 50)
        self.view.addSubview(gate4)
        
        finish.isUserInteractionEnabled = false
        finish.backgroundColor = UIColor.green
        finish.frame = CGRect(x: (screen.width/2), y: 25, width: 70, height: 70)
        self.view.addSubview(finish)
        
        
        if gameTime == 0 {
            gameTimer()
        }
    }
    
    @objc func movePlayer(_ recognizer :UIPanGestureRecognizer) {
        let screen: CGSize = UIScreen.main.bounds.size
        let movement: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x
            + movement.x, y: recognizer.view!.center.y + movement.y)
        recognizer.setTranslation(CGPoint(x:0, y:0), in: self.view)
        
        
        if((playerToken.frame.intersects(gate1.frame)) || (playerToken.frame.intersects(gate1.frame)) || (playerToken.frame.intersects(gate3.frame)) || (playerToken.frame.intersects(gate4.frame))){
            print("CONTACT")
            playerToken.center.x = screen.width/2
            playerToken.center.y = screen.height - 100
        }
        
        if playerToken.frame.intersects(finish.frame) {
            timer.invalidate()
            goToNextGame()
        }
    }
    func moveGate2()  {
        let screen: CGSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 2, animations: {
            () -> Void in
            self.gate2.center.x = screen.width - 50
        }, completion: {
            (Bool) -> Void in
            UIView.animate(withDuration: 2, animations: {
                () -> Void in
                self.gate2.center.x = 50
            }, completion: {
                (Bool) -> Void in
            })
        })
    }
    @objc func updateTimer() {
        gameTime += 0.1
        timeLeft.text = "Time: " + "\(gameTime)"
    }
    func gameTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: (#selector(game3Chase.updateTimer)), userInfo: nil, repeats: true)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // moveGate2()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

