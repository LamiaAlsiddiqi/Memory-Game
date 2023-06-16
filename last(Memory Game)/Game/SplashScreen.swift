//
//  SplashScreen.swift
//  Game
//
//  Created by Lamia AlSiddiqi on 19/06/1444 AH.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        //if isActive {
        // Levels()
        // } else {
        NavigationView {
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
                    
                    Image("Memory")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 3.5)) {
                                self.size = 1.2
                                self.opacity = 1.0
                                
                            }
                        }
                    
                    VStack {
                        NavigationLink(destination: Levels()) {
                            
                            Text("Start the Game")
                                .frame(width: 300, height: 56)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .background(Color(red: 0.002, green: 0.355, blue: 0.76))
                                .cornerRadius(8)
                                .shadow(color: .white, radius: 6, x:0, y:6)
                                .padding(.top, 500)
                            
                            
                        }
                    }
                }
                
                //                .onAppear {
                //                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                //                        self.isActive = true
                //                    }
                //                }
            }
            
        }.accentColor(.white)
    }
          }
       // }


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

