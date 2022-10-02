//
//  BlurView.swift
//  WeatherAppSwiftUI
//
//  Created by Мария Коханчик on 02.10.2022.
//

import SwiftUI

class UIBackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop: UIViewRepresentable {
    func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIBackdropView, context: Context) {}
}

struct BlurView: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

//struct Blur_Previews: PreviewProvider {
//    static var previews: some View {
//        BlurView()
//    }
//}
