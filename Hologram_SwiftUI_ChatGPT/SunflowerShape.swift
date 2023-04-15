//
//  SunflowerShape.swift
//  Hologram_SwiftUI_ChatGPT
//
//  Created by Brenda Saavedra  on 15/04/23.
//

import SwiftUI

struct SunflowerShape: Shape {
    let petals: Int = 12
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let petalRadius = radius * 0.3
        let angle = 2 * CGFloat.pi / CGFloat(petals)
        
        for i in 0..<petals {
            let petalAngle = angle * CGFloat(i)
            let x = center.x + radius * cos(petalAngle)
            let y = center.y + radius * sin(petalAngle)
            path.addEllipse(in: CGRect(x: x - petalRadius, y: y - petalRadius, width: petalRadius * 2, height: petalRadius * 2))
        }
        
        return path
    }
}
