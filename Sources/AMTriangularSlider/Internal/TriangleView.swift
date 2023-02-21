//
//  TriangleView.swift
//  
//
//  Created by Alessandro Manilii on 21/02/23.
//

import SwiftUI

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct TriangleView: View {
    
    let cornerRadius: CGFloat
    var background: LinearGradient
    
    var body: some View {

            ZStack {
                TriangleShape()
                    .fill(background)

                TriangleShape()
                    .stroke(background,
                            style: StrokeStyle(lineWidth: cornerRadius,
                                               lineCap: .round,
                                               lineJoin: .round)
                    )
            }

    }
}
