//
//  DecimalSlider.swift
//  GameSliderSwiftUI
//
//  Created by Никита Горбунов on 28.04.2022.
//

import SwiftUI

struct DecimalSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    let alphaThumb: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let sliderView = UISlider()
        sliderView.minimumValue = 1
        sliderView.maximumValue = 100
        sliderView.backgroundColor = .gray
        sliderView.tintColor = .black
        sliderView.layer.cornerRadius = 10
        
        sliderView.addTarget(
            context.coordinator,
            action: #selector(Coordinator.setSliderValue),
            for: .valueChanged
        )
        
        return sliderView
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = .red.withAlphaComponent(alphaThumb)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension DecimalSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func setSliderValue(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct DecimalSlider_Previews: PreviewProvider {
    static var previews: some View {
        DecimalSlider(sliderValue: .constant(50), alphaThumb: 0.5)
    }
}
