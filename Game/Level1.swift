//
//  Level1.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI

struct Level1: View {
    private var twoColumnGrid =  [GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var threeColumnGrid = [GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible())]
                                  // GridItem(.flexible()),
                                  // GridItem(.flexible()),
                                   //GridItem(.flexible())]
    
    
    
    @State var cards = creatCardList1().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    @State var levels : Int = 2
    
    
    var body: some View {
        
        GeometryReader {geo in
            ZStack{
                RadialGradient(
                    gradient: Gradient (colors: [Color (.black), Color(.systemBlue)]),
                    center: .bottom,
                    startRadius: 5,
                    endRadius: 600)
                .ignoresSafeArea()
                
            }
            VStack{
                Text("Sports")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, -20.0)
                
                LazyVGrid(columns: twoColumnGrid, spacing: 10){
                    ForEach(cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/2 - 18),
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices)
                    }
                    
                }

                VStack{
                    
                    Text("Match These Cards to Win")
                        .foregroundColor(.white)
                        .font(.title3)
                    
                   // let cardValues1 = cardValues[0...12/levels-1]
                    LazyVGrid(columns: threeColumnGrid, spacing: 16){
                        ForEach (cardValues1, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}){
                                Text(cardValue)
                                    .font(.system(size: 60))
                            }
                            
                        }
                    }
                }
            }

        }
    }
}

struct Level1_Previews: PreviewProvider {
    static var previews: some View {
        Level1()
    }
}
