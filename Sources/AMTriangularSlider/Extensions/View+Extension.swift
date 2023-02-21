//
//  View+Extension.swift
//  
//
//  Created by Alessandro Manilii on 21/02/23.
//

import SwiftUI

internal extension View {
    
    @inlinable
    func reverseMask<Mask: View>(alignment: Alignment = .center,
                                        @ViewBuilder _ mask: () -> Mask) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask().blendMode(.destinationOut)
                }
        }
    }
}
