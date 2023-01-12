//
//  Memory.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import Foundation
import SwiftUI


class Card: Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text:String
    
    init(text:String){
        self.text = text
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
}
//"⚽️","🏓","🏹","🏀","🥎","🥊",
let cardValues1:[String] = [
    "⛷️","⛹🏻","🤾🏽‍♂️"//,//"🏇","🏊🏽‍♂️","🚴🏽"
]

let cardValues2:[String] = [
   "🦐","🐙","🐠","🦀","🐬","🐋"
]


let cardValues3:[String] = [
    "🐅","🦓","🦍","🐘","🐪","🦒","🐑","🐈","🐇","🐄"
]


let cardValues4:[String] = [
   "🌭","🍔","🍟","🍕","🍱","🍿","🥤","🥛","🧃","☕️","🍹","🧋",
]



func creatCardList1() -> [Card] {
    //create a blink list
    var cardList = [Card]()
    
    for cardValue in cardValues1 {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

func creatCardList2() -> [Card] {
    //create a blink list
    var cardList = [Card]()
    
    for cardValue in cardValues2 {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

func creatCardList3() -> [Card] {
    //create a blink list
    var cardList = [Card]()
    
    for cardValue in cardValues3 {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

func creatCardList4() -> [Card] {
    //create a blink list
    var cardList = [Card]()
    
    for cardValue in cardValues4 {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

let faceDownCard = Card(text: "?")
    
