//
//  Level2.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI
import AVKit

struct Level2: View {
    private var threeColumnGrid =  [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                    GridItem(.flexible())]
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible()),
                                  GridItem(.flexible())]
                                 // GridItem(.flexible()),
                               // GridItem(.flexible())]
    
    
    
    @State var cards = creatCardList2().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    @State var levels : Int = 2
    @State var audioPlayer: AVAudioPlayer!
        @State var won: Bool = false
    
    
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
                Text("Ocean")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                LazyVGrid(columns: threeColumnGrid, spacing: 10){
                    ForEach(cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/3 - 18),
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices)
                    }
                    
                }
                
                //.padding()

                VStack{
                    
                    Text("Match These Cards to Win")
                        .foregroundColor(.white)
                        .font(.title3)
                   // let cardValues1 = cardValues[0...12/levels-1]
                    LazyVGrid(columns: threeColumnGrid, spacing: 16){
                        ForEach (cardValues2, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}){
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                            
                        }
                    }
                }
            }
            if MatchedCards.count == cards.count {
                           Color(.black).opacity(0.5)
                               .ignoresSafeArea()
                           HStack(alignment: .center) {
                               Spacer()
                               VStack(alignment: .center) {
                                   Spacer()
                                   Text("Excellent")
                                       .font(.largeTitle)
                                       .foregroundColor(.white)
                                   
                                   Button("Play Again") {
                                       resetGame()
                                   }
                                   .padding()
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                                   
                                   NavigationLink(destination: Level3()) {
                                       Text("Next Level")
                                   }
                                   .padding()
                                   .background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                                   .padding()
                                   Spacer()
                                   
                               }.onAppear {
                                   if !won {
                                       let sound = Bundle.main.path(forResource: "win", ofType: "wav")
                                                                              self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                                       self.audioPlayer.play()
                                       
                                       won = true
                                   }
                               }
                               
                               .padding()
                               .zIndex(100)
                               Spacer()
                           }
                       }
        }
    }
    func resetGame() {
           cards = creatCardList1().shuffled()
           MatchedCards = []
           UserChoices = []
           won = false
       }
}

struct Level2_Previews: PreviewProvider {
    static var previews: some View {
        Level2()
    }
}
