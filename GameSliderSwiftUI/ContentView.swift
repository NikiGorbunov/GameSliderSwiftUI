//
//  ContentView.swift
//  GameSliderSwiftUI
//
//  Created by Никита Горбунов on 28.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                DecimalSlider(SliderValue: $currentValue, alphaThumb: getAlpha())
                    .onChange(of: currentValue){ newValue in
                        currentValue = newValue
                    }
                    .alert("Твой счет", isPresented: $alertIsPresented, actions: {}) {
                        Text("\(computeScore())")
                    }
                Text("100")
            }
            Button("Проверь меня") {
                showAlert()
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                withAnimation {
                    currentValue = Float.random(in: 0...100)
                }
            }
        }
        .padding()
    }
}


extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    private func getAlpha() -> CGFloat {
        CGFloat(Double(computeScore()) / 100.0)
    }
    
    private func showAlert() {
        alertIsPresented.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
