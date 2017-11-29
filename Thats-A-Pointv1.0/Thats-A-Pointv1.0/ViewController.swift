//
//  ViewController.swift
//  thatsAPoint
//
//  Created by Krueger, Ross L on 11/27/17.
//  Copyright © 2017 Krueger, Ross L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let appName: UILabel
    private let beginButton: UIButton
    
    init() {
        
        appName = UILabel()
        beginButton = UIButton(type: UIButtonType.custom)
        
        super.init(nibName: nil, bundle: nil)
        
        let screen: CGSize = UIScreen.main.bounds.size
        let midX: CGFloat = screen.width / 2
        let midY: CGFloat = screen.height / 2
        
        appName.text = "That's  a Point"
        appName.frame = CGRect(x: screen.width - 120, y:0, width: 200, height: 150)
        self.view.addSubview(appName)
        
        beginButton.frame = CGRect(x: midX, y: midY, width: 100, height: 100)
        beginButton.backgroundColor = UIColor.blue
        beginButton.addTarget(self, action: #selector(ViewController.beginButtonPressed),for: UIControlEvents.touchUpInside)
        beginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.beginButtonPressed(_:))))
        beginButton.isEnabled = true
        beginButton.setTitle("Begin", for: UIControlState.normal)
        self.view.addSubview(beginButton)
        
        
        // beginButton
    }
    
    @objc func beginButtonPressed(_ recognizer: UITapGestureRecognizer) {
        //let game1: game1Tap = game1Tap()
        //game1.view.backgroundColor = UIColor.gray
        //self.present(game1, animated: false) { () -> Void in
        let game2: game2Bounce = game2Bounce()
        game2.view.backgroundColor = UIColor.gray
        self.present(game2, animated: false) { () -> Void in
            /*let game3: game3Chase = game3Chase()
             game3.view.backgroundColor = UIColor.gray
             self.present(game3, animated: false) { () -> Void in */
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

