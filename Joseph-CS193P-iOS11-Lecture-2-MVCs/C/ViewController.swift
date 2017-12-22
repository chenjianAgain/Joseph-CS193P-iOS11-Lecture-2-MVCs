//
//  ViewController.swift
//  Joseph-CS193P-iOS11-Lecture-2-MVCs
//
//  Created by chenjian on 2017/12/22.
//  Copyright © 2017年 chenjian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    lazy var game = Concentration(numbersOfPairsOfCards: cardButtons.count / 2)
    
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    private let emojis = ["陈", "健", "好", "皮", "啊", "里", "票", "漂", "亮", "是", "比", ]
    
    // MARK: - User Interface
    
    @IBAction func touchCard(_ sender: UIButton!) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            // Change Model
            game.flipCard(at: cardNumber)
            // Update UI
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: - Private Implementation
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            if game.cards[index].isFaceUp {
                cardButtons[index].setTitle(emojis[index/2], for: UIControlState.normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cardButtons[index].setTitle("", for: UIControlState.normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

