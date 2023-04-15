//
//  HologramShape.swift
//  Hologram_SwiftUI_ChatGPT
//
//  Created by Brenda Saavedra  on 15/04/23.
//

import SwiftUI

struct HologramShape: Shape {
    let columns: Int = 5
    let rows: Int = 5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let cellWidth = rect.width / CGFloat(columns)
        let cellHeight = rect.height / CGFloat(rows)
        let circleRadius = min(cellWidth, cellHeight) / 2
        
        for row in 0..<rows {
            for column in 0..<columns {
                let x = CGFloat(column) * cellWidth + cellWidth / 2
                let y = CGFloat(row) * cellHeight + cellHeight / 2
                path.addEllipse(in: CGRect(x: x - circleRadius, y: y - circleRadius, width: circleRadius * 2, height: circleRadius * 2))
            }
        }
        
        return path
    }
}
