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
    
    var card1Value: Int = 0
    var card2Value: Int = 0
    var card3Value: Int = 0
    var card4Value: Int = 0
    var card5Value: Int = 0
    
    @IBOutlet weak var handLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        card1Value = 2
        card2Value = 14
        card3Value = 23
        card4Value = 25
        card5Value = 11
        
        handLabel.text = currentHand()
        
        printCard(cardToPrint: card1, card: card1Value)
        printCard(cardToPrint: card2, card: card2Value)
        printCard(cardToPrint: card3, card: card3Value)
        printCard(cardToPrint: card4, card: card4Value)
        printCard(cardToPrint: card5, card: card5Value)
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
    
    func currentHand() -> String {
        var currentHand: [Int] = [card1Value, card2Value, card3Value, card4Value, card5Value]
        currentHand.sort()
        var sortValueHand: [Int] = [currentHand[0]%13, currentHand[1]%13, currentHand[2]%13, currentHand[3]%13, currentHand[4]%13]
        sortValueHand.sort() //Puts cards in order so 4 alike card will be in a row and can have fourcount ==3 when 4 of a kind is reached
        print("Current Hand: " + String(describing: currentHand))
        print("Value Hand: " + String(describing: sortValueHand))
        /////////////////////////
        //Check for royal flush//
        /////////////////////////
        if(currentHand[0]%13 == 0) {
            //If first card is Ace proceed
            if(currentHand[1]%13 == 9 && currentHand[1]/14 == currentHand[0]/13) {
                // Check if next card is a 10 and same suit as ace
                if(currentHand[2]%13 == 10 && currentHand[2]/14 == currentHand[0]/13) {
                    // Check if next card is a J and same suit as ace
                    if(currentHand[3]%13 == 11 && currentHand[3]/14 == currentHand[0]/13) {
                        // Check if next card is a Q and same suit as ace
                        print(currentHand[4])
                        if(currentHand[4]%13 == 12 && currentHand[4]/14 == currentHand[0]/13) {
                            // Check if next card is a K and same suit as ace
                            return "Royal Flush"
                        }
                    }
                }
            }
        }
        
        ////////////////////////////
        //Check for Straight Flush//
        ////////////////////////////
        if(currentHand[0]%13 < 9) {
            //First card has to be less than 10 because we already checked for royal flush
            if(currentHand[0]+1 == currentHand[1] && currentHand[1]+1 == currentHand[2] && currentHand[2]+1 == currentHand[3] && currentHand[3]+1 == currentHand[4]) {
                // High card value will be currentHand[4]
                return "Straight Flush"
            }
        }

        ////////////////////////////
        //Check for Four of a Kind//
        ////////////////////////////
        var fourcount = 0
        var lastCard = 0
        for i in 0 ..< sortValueHand.count {
            if(i>0) {
                if(lastCard == sortValueHand[i]) {
                    fourcount += 1
                    lastCard = sortValueHand[i]
                }
            } else {
                lastCard = sortValueHand[i]
            }
        }
        if(fourcount == 3) {
            // Will need to return high card value
            return "Four of a Kind"
        }
        
        ////////////////////////
        //Check for Full Hour //
        ////////////////////////
        if(sortValueHand[0]==sortValueHand[1] && sortValueHand[2] == sortValueHand[3] && sortValueHand[3] == sortValueHand[4]) {
            return "Full House"
        }
        if(sortValueHand[3]==sortValueHand[4] && sortValueHand[0] == sortValueHand[1] && sortValueHand[1] == sortValueHand[2]) {
            return "Full House"
        }
        
        ////////////////////
        //Check for Flush //
        ////////////////////
        if(currentHand[0]/14 == currentHand[1]/14 && currentHand[1]/14 == currentHand[2]/14 && currentHand[2]/14 == currentHand[3]/14 && currentHand[0]/14 == currentHand[4]/14) {
            return "Flush"
        }

        ///////////////////////
        //Check for Straight //
        ///////////////////////
        if(sortValueHand[0]%13 < 9) {
            //First card has to be less than 10 because we already checked for royal flush
            if(sortValueHand[0]+1 == sortValueHand[1] && sortValueHand[1]+1 == sortValueHand[2] && sortValueHand[2]+1 == currentHand[3] && sortValueHand[3]+1 == sortValueHand[4]) {
                return "Straight"
            }
        }
        // Check for 10 - A
        if(sortValueHand[0] == 0 && sortValueHand[1] == 9 && sortValueHand[2] == 10 && sortValueHand[3] == 11 && sortValueHand[4] == 12) {
            return "Straight"
        }
        
        //////////////////////////
        //Check for 3 of a Kind //
        //////////////////////////
        var threecount = 0
        var lastCardThree = 0
        for i in 0 ..< sortValueHand.count {
            if(i>0) {
                if(lastCardThree == sortValueHand[i]) {
                    threecount += 1
                    lastCardThree = sortValueHand[i]
                    if(threecount == 2) {
                        // Will need to return high card value
                        return "Three of a Kind"
                    }
                }
                else {
                    threecount = 0
                }
            } else {
                lastCardThree = sortValueHand[i]
            }
        }

        /////////////////////
        //Check for 2 pair //
        /////////////////////
        var twocount = 0
        var lastCardTwo = 0
        for i in 0 ..< sortValueHand.count {
            if(i>0) {
                if(lastCardTwo == sortValueHand[i]) {
                    twocount += 1
                    lastCardTwo = sortValueHand[i]
                    if(twocount == 2) {
                        // Will need to return high card value
                        return "Two of a Kind"
                    }
                }
                else {
                    lastCardTwo = sortValueHand[i]
                }
            } else {
                lastCardTwo = sortValueHand[i]
            }
        }
        
        /////////////////////
        //Check for 1 pair //
        /////////////////////
        var paircount = 0
        var lastCardPair = 0
        for i in 0 ..< sortValueHand.count {
            if(i>0) {
                if(lastCardPair == sortValueHand[i]) {
                    paircount += 1
                    lastCardPair = sortValueHand[i]
                    if(paircount == 1) {
                        // Will need to return high card value
                        return "Pair"
                    }
                }
                else {
                    lastCardPair = sortValueHand[i]
                }
            } else {
                lastCardPair = sortValueHand[i]
            }
        }
        
        return "High Card"
    }
    
    
    func printCard(cardToPrint: UIButton, card: Int) {
        // card/ 14 = suit
        // 0 is spades
        // 1 is clubs
        // 2 is hearts
        // 3 is diamonds
        // card % 13 = cardValue
        // 0-9 = A - 10
        // 10 = J
        // 11 = Q
        // 12 = K
        let cardValue = card + 1 // this is because I messed up
        switch cardValue {
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

