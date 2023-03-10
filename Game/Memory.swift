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
//"β½οΈ","π","πΉ","π","π₯","π₯",
let cardValues1:[String] = [
    "β·οΈ","βΉπ»","π€Ύπ½ββοΈ"//,//"π","ππ½ββοΈ","π΄π½"
]

let cardValues2:[String] = [
   "π¦","π","π ","π¦","π¬","π"
]


let cardValues3:[String] = [
    "π","π¦","π¦","π","πͺ","π¦","π","π","π","π"
]


let cardValues4:[String] = [
   "π­","π","π","π","π±","πΏ","π₯€","π₯","π§","βοΈ","πΉ","π§",
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
    
