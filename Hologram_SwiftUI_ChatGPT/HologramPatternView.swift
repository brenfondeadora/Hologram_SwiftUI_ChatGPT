//
//  HologramPatternView.swift
//  Hologram_SwiftUI_ChatGPT
//
//  Created by Brenda Saavedra  on 15/04/23.
//

import SwiftUI

struct HologramPatternView: View {
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Add the converted SwiftUI Shape here
                HologramShape()
                    .stroke(lineWidth: 1)
                    .foregroundColor(isAnimating ? Color.blue : Color.black)
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
                    .opacity(isAnimating ? 0.0 : 1.0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onTapGesture {
                isAnimating.toggle()
            }
        }
    }
}

struct HologramPatternView_Previews: PreviewProvider {
    static var previews: some View {
        HologramPatternView()
    }
}
