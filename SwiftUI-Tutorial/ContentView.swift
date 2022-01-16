//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by K Ashok on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card11"
    @State var cpuCard = "card12"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var presentAlert = false
    
    var body: some View {
        
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    // Genarate random number between 2 to 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update card
                    playerCard = "card\(playerRand)"
                    cpuCard = "card\(cpuRand)"
                    
                    // Update score
                    playerScore += playerRand>cpuRand ? 1 : 0
                    cpuScore += playerRand<cpuRand ? 1 : 0
                    if playerRand == cpuRand {
                        presentAlert = true                        
                    }
                } label: {
                    Image("dealbutton")
                }.alert(isPresented: $presentAlert) {
                    Alert(
                        title: Text("Yoo!!!"),
                        message: Text("You both has same card.")
                    )
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    .foregroundColor(.white)
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(cpuScore.description)
                            .font(.largeTitle)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
            }
        }
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
