//
//  CardView.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI
import UIKit
import AVKit

struct CardView: View {
    
    @ObservedObject var card:Card
    
    let width:Int
    
    @Binding var MatchedCards: [Card]
    @Binding var UserChoices: [Card]
    @State var audioPlayer: AVAudioPlayer!
    
    
    var body: some View {
        Group {
            if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}){
                Text(card.text)
                    .font(.system(size: 90)).minimumScaleFactor(0.5)
                    .padding(5)
                
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                    )
            } else {
                if UIAccessibility.isSwitchControlRunning {
                    Image(systemName: "questionmark")
                        .font(.system(size: 50))
                        .padding()
                        .frame(width: CGFloat(width), height: CGFloat(width))
                        .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                        )
                    
                    //.onTapGesture {
                        .onLongPressGesture {
                            if UserChoices.count == 0 {
                                card.turnOver()
                                UserChoices.append(card)
                            } else if UserChoices.count == 1 {
                                card.turnOver()
                                UserChoices.append(card)
                                withAnimation(Animation.linear.delay(1)){
                                    for thisCard in UserChoices {
                                        thisCard.turnOver()
                                    }
                                }
                                checkForMatch()
                            }
                            self.audioPlayer.play()
                        }
                    
                }
                else{
                    Image(systemName: "questionmark")
                        .font(.system(size: 50))
                        .padding()
                        .frame(width: CGFloat(width), height: CGFloat(width))
                        .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                        )
                    
                        .onTapGesture {
                            //    .onLongPressGesture {
                            if UserChoices.count == 0 {
                                card.turnOver()
                                UserChoices.append(card)
                            } else if UserChoices.count == 1 {
                                card.turnOver()
                                UserChoices.append(card)
                                withAnimation(Animation.linear.delay(1)){
                                    for thisCard in UserChoices {
                                        thisCard.turnOver()
                                    }
                                }
                                checkForMatch()
                            }
                            self.audioPlayer.play()
                        }
                }
                
            }
        }.onAppear {
            print("Loaded")
            let sound = Bundle.main.path(forResource: "flip", ofType: "wav")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
    }
    
    func checkForMatch(){
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
            
        }
        UserChoices.removeAll()
        
    }
}
    

