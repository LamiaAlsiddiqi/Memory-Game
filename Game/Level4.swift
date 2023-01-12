//
//  Level4.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI

struct Level4: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible()),
                                 GridItem(.flexible())]
    
    
    
    @State var cards = creatCardList4().shuffled()
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
                Text("Food & Drinks")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                LazyVGrid(columns: fourColumnGrid, spacing: 10){
                    ForEach(cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/4.5 - 10),
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices)

                    }
                    
                }
                
            
                VStack{
           
                    Text("Match These Cards to Win")
                        .foregroundColor(.white)
                        .font(.title3)
             
                    //let cardV = cardValues[0...12/levels-1]
                    
                    LazyVGrid(columns: sixColumnGrid, spacing: 13){
                        ForEach (cardValues4, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}){
                                Text(cardValue)
                                    .font(.system(size: 30))
                            }

                        }
                    }
                }
            }
        }
    }
}

struct Level5_Previews: PreviewProvider {
    static var previews: some View {
        Level4()
    }
}
