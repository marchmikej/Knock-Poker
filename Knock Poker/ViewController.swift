//
//  ViewController.swift
//  Knock Poker
//
//  Created by Michael March on 4/22/17.
//  Copyright © 2017 Michael March. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawPile: UIButton!
    @IBOutlet weak var discardPile: UIButton!
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printCard(cardToPrint: card1, card: 3)
        printCard(cardToPrint: card2, card: 4)
        printCard(cardToPrint: card3, card: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func card1Pressed(_ sender: Any) {
        printCard(cardToPrint: card1, card: 5)
    }
    
    @IBAction func card2Pressed(_ sender: Any) {
    }
    @IBAction func card3Pressed(_ sender: Any) {
    }
    @IBAction func card4Pressed(_ sender: Any) {
    }
    @IBAction func card5Pressed(_ sender: Any) {
    }

    @IBAction func drawPilePressed(_ sender: Any) {
    }
    
    @IBAction func discardPilePressed(_ sender: Any) {
    }
    
    
    
    
    func printCard(cardToPrint: UIButton, card: Int) {
        // card/ 13 = suit
        // 0 is spades
        // 1 is clubs
        // 2 is hearts
        // 3 is diamonds
        // card % 13 = cardValue
        // 1-10 = A - 10
        // 11 = J
        // 12 = Q
        // 13 = K
        cardToPrint.setImage(#imageLiteral(resourceName: "K_clubs"), for: UIControlState.normal)
        switch card {
        case 1:
            cardToPrint.setImage(#imageLiteral(resourceName: "A_spades"), for: UIControlState.normal)
        case 2:
            cardToPrint.setImage(#imageLiteral(resourceName: "2_spades"), for: UIControlState.normal)
        case 3:
            cardToPrint.setImage(#imageLiteral(resourceName: "3_spades"), for: UIControlState.normal)
        case 4:
            cardToPrint.setImage(#imageLiteral(resourceName: "4_spades"), for: UIControlState.normal)
        case 5:
            cardToPrint.setImage(#imageLiteral(resourceName: "5_spades"), for: UIControlState.normal)
        case 6:
            cardToPrint.setImage(#imageLiteral(resourceName: "6_spades"), for: UIControlState.normal)
        case 7:
            cardToPrint.setImage(#imageLiteral(resourceName: "7_spades"), for: UIControlState.normal)
        case 8:
            cardToPrint.setImage(#imageLiteral(resourceName: "8_spades"), for: UIControlState.normal)
        case 9:
            cardToPrint.setImage(#imageLiteral(resourceName: "9_spades"), for: UIControlState.normal)
        case 10:
            cardToPrint.setImage(#imageLiteral(resourceName: "10_spades"), for: UIControlState.normal)
        case 11:
            cardToPrint.setImage(#imageLiteral(resourceName: "J_spades"), for: UIControlState.normal)
        case 12:
            cardToPrint.setImage(#imageLiteral(resourceName: "Q_spades"), for: UIControlState.normal)
        case 13:
            cardToPrint.setImage(#imageLiteral(resourceName: "K_spades"), for: UIControlState.normal)
        case 14:
            cardToPrint.setImage(#imageLiteral(resourceName: "A_clubs"), for: UIControlState.normal)
        case 15:
            cardToPrint.setImage(#imageLiteral(resourceName: "2_clubs"), for: UIControlState.normal)
        case 16:
            cardToPrint.setImage(#imageLiteral(resourceName: "3_clubs"), for: UIControlState.normal)
        case 17:
            cardToPrint.setImage(#imageLiteral(resourceName: "4_clubs"), for: UIControlState.normal)
        case 18:
            cardToPrint.setImage(#imageLiteral(resourceName: "5_clubs"), for: UIControlState.normal)
        case 19:
            cardToPrint.setImage(#imageLiteral(resourceName: "6_clubs"), for: UIControlState.normal)
        case 20:
            cardToPrint.setImage(#imageLiteral(resourceName: "7_clubs"), for: UIControlState.normal)
        case 21:
            cardToPrint.setImage(#imageLiteral(resourceName: "8_clubs"), for: UIControlState.normal)
        case 22:
            cardToPrint.setImage(#imageLiteral(resourceName: "9_clubs"), for: UIControlState.normal)
        case 23:
            cardToPrint.setImage(#imageLiteral(resourceName: "10_clubs"), for: UIControlState.normal)
        case 24:
            cardToPrint.setImage(#imageLiteral(resourceName: "J_clubs"), for: UIControlState.normal)
        case 25:
            cardToPrint.setImage(#imageLiteral(resourceName: "Q_clubs"), for: UIControlState.normal)
        case 26:
            cardToPrint.setImage(#imageLiteral(resourceName: "K_clubs"), for: UIControlState.normal)
        case 27:
            cardToPrint.setImage(#imageLiteral(resourceName: "A__hearts"), for: UIControlState.normal)
        case 28:
            cardToPrint.setImage(#imageLiteral(resourceName: "2_hearts"), for: UIControlState.normal)
        case 29:
            cardToPrint.setImage(#imageLiteral(resourceName: "3_hearts"), for: UIControlState.normal)
        case 30:
            cardToPrint.setImage(#imageLiteral(resourceName: "4_hearts"), for: UIControlState.normal)
        case 31:
            cardToPrint.setImage(#imageLiteral(resourceName: "5_hearts"), for: UIControlState.normal)
        case 32:
            cardToPrint.setImage(#imageLiteral(resourceName: "6_hearts"), for: UIControlState.normal)
        case 33:
            cardToPrint.setImage(#imageLiteral(resourceName: "7_hearts"), for: UIControlState.normal)
        case 34:
            cardToPrint.setImage(#imageLiteral(resourceName: "8_hearts"), for: UIControlState.normal)
        case 35:
            cardToPrint.setImage(#imageLiteral(resourceName: "9_hearts"), for: UIControlState.normal)
        case 36:
            cardToPrint.setImage(#imageLiteral(resourceName: "10_hearts"), for: UIControlState.normal)
        case 37:
            cardToPrint.setImage(#imageLiteral(resourceName: "J_hearts"), for: UIControlState.normal)
        case 38:
            cardToPrint.setImage(#imageLiteral(resourceName: "Q_hearts"), for: UIControlState.normal)
        case 39:
            cardToPrint.setImage(#imageLiteral(resourceName: "K_hearts"), for: UIControlState.normal)
        case 40:
            cardToPrint.setImage(#imageLiteral(resourceName: "A_diamonds"), for: UIControlState.normal)
        case 41:
            cardToPrint.setImage(#imageLiteral(resourceName: "2_diamonds"), for: UIControlState.normal)
        case 42:
            cardToPrint.setImage(#imageLiteral(resourceName: "3_diamonds"), for: UIControlState.normal)
        case 43:
            cardToPrint.setImage(#imageLiteral(resourceName: "4_diamonds"), for: UIControlState.normal)
        case 44:
            cardToPrint.setImage(#imageLiteral(resourceName: "5_diamonds"), for: UIControlState.normal)
        case 45:
            cardToPrint.setImage(#imageLiteral(resourceName: "6_diamonds"), for: UIControlState.normal)
        case 46:
            cardToPrint.setImage(#imageLiteral(resourceName: "7_diamonds"), for: UIControlState.normal)
        case 47:
            cardToPrint.setImage(#imageLiteral(resourceName: "8_diamonds"), for: UIControlState.normal)
        case 48:
            cardToPrint.setImage(#imageLiteral(resourceName: "9_diamonds"), for: UIControlState.normal)
        case 49:
            cardToPrint.setImage(#imageLiteral(resourceName: "10_diamonds"), for: UIControlState.normal)
        case 50:
            cardToPrint.setImage(#imageLiteral(resourceName: "J_diamonds"), for: UIControlState.normal)
        case 51:
            cardToPrint.setImage(#imageLiteral(resourceName: "Q_diamonds"), for: UIControlState.normal)
        case 52:
            cardToPrint.setImage(#imageLiteral(resourceName: "K_diamonds"), for: UIControlState.normal)
        default:
            print("Invalid card number")
        }
    }


}

