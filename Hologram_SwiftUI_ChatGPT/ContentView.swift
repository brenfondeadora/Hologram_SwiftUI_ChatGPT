//
//  ContentView.swift
//  Hologram_SwiftUI_ChatGPT
//
//  Created by Brenda Saavedra  on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isGalaxy = false
    
    var body: some View {
        ZStack {
            SunflowerView()
                .opacity(isGalaxy ? 0.0 : 1.0)
                .animation(.easeInOut(duration: 1.5))
            
            GalaxyView()
                .opacity(isGalaxy ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 1.5))
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation(.spring()) {
                isGalaxy.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SunflowerShape: Shape {
    let seedCount: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let angleIncrement = 2 * Double.pi * (1.0 - (1.0 / Constants.goldenRatio))
        let maxRadius = min(rect.width, rect.height) * 0.5
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        for i in 0..<seedCount {
            let radius = sqrt(Double(i)) * maxRadius / sqrt(Double(seedCount))
            let angle = Double(i) * angleIncrement
            let x = center.x + CGFloat(radius * cos(angle))
            let y = center.y + CGFloat(radius * sin(angle))
            let circleSize = CGFloat(1.0 - (radius / maxRadius)) * 8
            let circle = Path(ellipseIn: CGRect(x: x - circleSize * 0.5, y: y - circleSize * 0.5, width: circleSize, height: circleSize))
            path.addPath(circle)
        }
        
        return path
    }
    
    struct Constants {
        static let goldenRatio: Double = 1.61803398875
    }
}

struct SunflowerView: View {
    private let seedCount = 200
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<seedCount) { index in
                    Circle()
                        .fill(randomColor())
                        .frame(width: circleSize(index: index, rect: geometry.frame(in: .local)), height: circleSize(index: index, rect: geometry.frame(in: .local)))
                        .position(circlePosition(index: index, rect: geometry.frame(in: .local)))
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
        return colors.randomElement() ?? .black
    }
    
    private func circlePosition(index: Int, rect: CGRect) -> CGPoint {
        let angleIncrement = 2 * Double.pi * (1.0 - (1.0 / Constants.goldenRatio))
        let maxRadius = min(rect.width, rect.height) * 0.5
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        
        let radius = sqrt(Double(index)) * maxRadius / sqrt(Double(seedCount))
        let angle = Double(index) * angleIncrement
        let x = center.x + CGFloat(radius * cos(angle))
        let y = center.y + CGFloat(radius * sin(angle))
        
        return CGPoint(x: x, y: y)
    }
    
    private func circleSize(index: Int, rect: CGRect) -> CGFloat {
        let maxRadius = min(rect.width, rect.height) * 0.5
        let radius = sqrt(Double(index)) * maxRadius / sqrt(Double(seedCount))
        return CGFloat(1.0 - (radius / maxRadius)) * 8 * 3
    }
    
    struct Constants {
        static let goldenRatio: Double = 1.61803398875
    }
}

struct GalaxyView: View {
    private let pointCount = 700
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<pointCount) { index in
                    Circle()
                        .fill(randomColor())
                        .frame(width: 10, height: 10)
                        .position(pointPosition(index: index, rect: geometry.frame(in: .local)))
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
        return colors.randomElement() ?? .black
    }
    
    private func pointPosition(index: Int, rect: CGRect) -> CGPoint {
        let angleIncrement = 2 * Double.pi / Double(pointCount)
        let maxRadius = sqrt(pow(rect.width, 2) + pow(rect.height, 2)) / 2
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let radius = Double.random(in: 0..<maxRadius)
        let angle = Double(index) * angleIncrement
        let x = center.x + CGFloat(radius * cos(angle))
        let y = center.y + CGFloat(radius * sin(angle))
        
        return CGPoint(x: x, y: y)
    }
}
