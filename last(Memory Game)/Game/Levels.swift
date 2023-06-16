//
//  Levels.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI

struct Levels: View {
    
    var body: some View {
        
      

            GeometryReader {geo in
                ZStack{
                    RadialGradient(
                        gradient:
                            Gradient (colors: [Color (.black),
                                               Color(.systemBlue)]),
                        center: .bottom,
                        startRadius: 5,
                        endRadius: 600)
                    .ignoresSafeArea()
                    
                    VStack(spacing: 80.0){
                    
                        Text("Choose the Level")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Group {
                            
                            ScrollView {
                                
                                // Level 1 Button
                                
                                
                                
                                ZStack {
                                    
                                    NavigationLink(destination: Level1()) {
                                        
                                        Text("Level 1")
                                            .frame(width: 300, height: 56)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .background(Color(red: 0.002, green: 0.355, blue: 0.76))
                                            .cornerRadius(8)
                                            .shadow(color: .white, radius: 6, x:0, y:6)
                                            .padding()
                                        
                                    }
                                }
                                
                                
                                // Level 2 Button
                                ZStack {
                                    NavigationLink(destination: Level2()) {
                                        Text("Level 2")
                                            .frame(width: 300, height: 56)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .background(Color(red: 0.002, green: 0.355, blue: 0.76))
                                            .cornerRadius(8)
                                            .shadow(color: .white, radius: 6, x:0, y:6)
                                            .padding()
                                    }
                                }
                                
                                // Level 3 Button
                                ZStack {
                                    NavigationLink(destination: Level3()) {
                                        Text("Level 3")
                                            .frame(width: 300, height: 56)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .background(Color(red: 0.002, green: 0.355, blue: 0.76))
                                            .cornerRadius(8)
                                            .shadow(color: .white, radius: 6, x:0, y:6)
                                            .padding()
                                    }
                                }
                                
                                // Level 4 Button
                                ZStack {
                                    NavigationLink(destination: Level4()) {
                                        Text("Level 4")
                                            .frame(width: 300, height: 56)
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .background(Color(red: 0.002, green: 0.355, blue: 0.76))
                                            .cornerRadius(8)
                                            .shadow(color: .white, radius: 6, x:0, y:6)
                                            .padding()
                                    }
                                }
                                .padding(.bottom)
                                
                            
                                
                            }
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    .padding(.all, 32.0)
                }
            }
            
       
    }
    
}

struct Levels_Previews: PreviewProvider {
    static var previews: some View {
        Levels()
    }
}
