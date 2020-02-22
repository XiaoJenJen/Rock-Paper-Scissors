//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Miss.J on 2/20/20.
//  Copyright © 2020 JZPR. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = "Rocket"
    @State private var randNum2 = "Peekaboo"
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    @State private var num1WinCombination: [String: String] = ["Rock1": "Scissor2", "Paper1": "Rock2", "Scissor1": "Paper2"]
    
    @State private var num2WinCombination: [String: String] = ["Rock1": "Paper2", "Paper1": "Scissor2", "Scissor1": "Rock2"]
    
    var body: some View {
        
        VStack {
       
            Image("Background1")
            
            Text("""
Let's Play
Rock-Paper-Scissors!
""")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Button(action:{
                
                self.randNum1 = ["Rock1", "Paper1", "Scissor1"].randomElement()!
                
                self.randNum2 = ["Rock2", "Paper2", "Scissor2"].randomElement()!
                
                switch self.randNum2{
                    case self.num1WinCombination[self.randNum1]:
                        self.score1 += 1
                    case self.num2WinCombination[self.randNum1]:
                        self.score2 += 1
                    default:
                        self.score1 += 0
                        self.score2 += 0
                }
                
            }){
                Image("Go")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100.0, height: 85.0)
            }
            
            Spacer()
            
            HStack{
               
               Spacer()
                Image(randNum1).resizable()
                    .frame(width: 130.0, height: 130.0)
                
                Spacer()
                Image(randNum2).resizable()
                .frame(width: 130.0, height: 130.0)
                
                Spacer()
            }
            
            HStack{
                VStack{
                    Text("Rocket")
                        .font(.title)
                        .padding(.vertical)
                    Text(String(score1))
                        .font(.title)
                }
                .padding(.leading, 70)
                
                Spacer()
                
                VStack{
                    Text("Peekaboo")
                        .font(.title)
                        .padding(.vertical)
                    Text(String(score2))
                        .font(.title)
                }
                .padding(.trailing, 60)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
