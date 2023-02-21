//
//  AMTriangularSlider.swift
//
//
//  Created by Alessandro Manilii on 21/02/23.
//

import SwiftUI

public struct AMTriangularSlider: View {
    
    // MARK: Properties
    @Binding public var value: CGFloat
    
    public var cornerRadius: CGFloat
    public var sliderWidth: CGFloat
    public var sliderColor: Color
    public var background: LinearGradient
    
    private let strokeBorder: CGFloat = 5
    private let vPadding: CGFloat = 12
    private var slWidth: CGFloat { max(sliderWidth, 15) }
    
    public init(value: Binding<CGFloat>,
                cornerRadius: CGFloat = 10,
                sliderWidth: CGFloat = 15,
                sliderColor: Color,
                background: LinearGradient) {
        self._value = value
        self.cornerRadius = cornerRadius
        self.sliderWidth = sliderWidth
        self.sliderColor = sliderColor
        self.background = background
    }
    
    // MARK: Body
    public var body: some View {
        
        GeometryReader { proxy in
            
            let height = proxy.size.height

            TriangleView(cornerRadius: cornerRadius,
                         background: background)
            .padding(cornerRadius/2)
            .padding(.vertical, vPadding)
            .reverseMask {
                Capsule()
                    .strokeBorder(.white, lineWidth: strokeBorder)
                    .frame(width: slWidth,
                           height: getAllowedHeight(in: height))
                    .position(x: value * (proxy.size.width - slWidth) + slWidth/2,
                              y: proxy.size.height - getAllowedHeight(in: height)/2)
            }
            
            ZStack {
                Capsule()
                    .fill(sliderColor)
                    .padding(.vertical, 2)
                    .reverseMask {
                        Capsule()
                            .strokeBorder(.white, lineWidth: 5)
                    }
            }
            .frame(width: slWidth,
                   height: getAllowedHeight(in: height))
            .position(x: value * (proxy.size.width - slWidth) + slWidth/2,
                      y: proxy.size.height - getAllowedHeight(in: height)/2)
            .gesture(
                DragGesture()
                    .onChanged { dragValue in
                        
                        let x = dragValue.location.x.clamped(
                            to: slWidth/2...proxy.size.width - slWidth/2
                        )
                        
                        value = (x - slWidth/2) / (proxy.size.width - slWidth)
                    }
            )
        }
    }
}

// MARK: Private
private extension AMTriangularSlider {
    private func getAllowedHeight(in frameHeight: CGFloat) -> CGFloat {
        let minHeight: CGFloat = cornerRadius + 2 * vPadding
        let heighFraction = (frameHeight - minHeight) * value
        return  (minHeight + heighFraction).clamped(to: 30...frameHeight)
    }
}
