//
//  ContentView.swift
//  TrafficLight
//
//  Created by Андрей Поморцев on 12.05.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ColorCircleView: View {
    let color: Color
    let alpha: Double
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .opacity(alpha)
            .foregroundColor(color)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .padding(.top)
        
    }
    
}

struct ContentView: View {
    @State var titleButton = "START"
    
    @State var currentLight = CurrentLight.red
    
    @State var lightRed: Double
    @State var lightYellow: Double
    @State var lightGreen: Double
    
    let lightIsOn = 1.0
    let lightIsOff  = 0.3
    
    init() {
        lightRed = lightIsOff
        lightYellow = lightIsOff
        lightGreen = lightIsOff
        
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ColorCircleView(color: .red, alpha: lightRed)
                ColorCircleView(color: .yellow, alpha: lightYellow)
                ColorCircleView(color: .green, alpha: lightGreen)
                Spacer()
                startButton
                
            }
            .padding(EdgeInsets(top: 25, leading: 0, bottom: 25, trailing: 0))
        }
        
    }
    
     var startButton: some View {
        Button(action: startButtonPressed) {
            Text(titleButton)
                .fontWeight(.bold)
                .font(.title)
                .padding(EdgeInsets(top: 10, leading: 55, bottom: 10, trailing: 55))
                .background(.blue)
                .cornerRadius(15)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 5))
            
        }
         
     }
    
    func startButtonPressed() {
        if titleButton == "START" {
            titleButton = "NEXT"
        }
        
        switch currentLight {
        case .red:
            lightGreen = lightIsOff
            lightRed = lightIsOn
            currentLight = .yellow
        case .yellow:
            lightRed = lightIsOff
            lightYellow = lightIsOn
            currentLight = .green
        case .green:
            lightGreen = lightIsOn
            lightYellow = lightIsOff
            currentLight = .red
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            
        }
    }
}
