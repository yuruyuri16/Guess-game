//
//  ContentView.swift
//  Guess game
//
//  Created by Miguel Yurivilca on 12/12/19.
//  Copyright © 2019 Miguel Yurivilca. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Game()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Game: View {
    private var gameNumber = Int.random(in: 1...100)
    @State private var guessedNumber = 0.0
    @State private var message: String = ""
    @State private var showMessage = false
        
    func checkNumber() {
        showMessage = true
        if Int(guessedNumber) > gameNumber {
            message = "Too high"
        }
        else if Int(guessedNumber) < gameNumber {
            message = "Too low"
        }
        else {
            message = "You won"
        }
    }
    
    var body: some View {
        VStack {
            if showMessage {
                Text(message)
            }
            Slider(value: $guessedNumber, in: 0...100, step: 1)
                .padding()
            Text("\(Int(guessedNumber))")
                .padding(.bottom, 50)
//            Picker(selection: $guessedNumber, label:
//                Text("Number")
//            ) {
//                ForEach(0...100, id: \.self) { number in
//                    Text(String(number))
//                }
//            }
//            .padding()
            Button(action: {self.checkNumber()}) {
                Text("Click me")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(30)
            }
        }
    }
}
