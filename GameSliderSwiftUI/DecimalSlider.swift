//
//  DecimalSlider.swift
//  GameSliderSwiftUI
//
//  Created by Никита Горбунов on 28.04.2022.
//

import SwiftUI

struct DecimalSlider: UIViewRepresentable {
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let sliderView = UISlider()
        sliderView.minimumValue = 0
        sliderView.maximumValue = 100
        sliderView.backgroundColor = .gray
        sliderView.minimumTrackTintColor = .black
        sliderView.maximumTrackTintColor = .black
        sliderView.thumbTintColor = .red
        sliderView.layer.cornerRadius = 10
        
        return sliderView
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
    }
}

struct DecimalSlider_Previews: PreviewProvider {
    static var previews: some View {
        DecimalSlider(value: .constant(50))
    }
}
