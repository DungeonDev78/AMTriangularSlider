//
//  FloatingPoint+Extension.swift
//  
//
//  Created by Alessandro Manilii on 21/02/23.
//

import Foundation

internal extension FloatingPoint {
    
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(min(self, range.upperBound), range.lowerBound)
    }
}
