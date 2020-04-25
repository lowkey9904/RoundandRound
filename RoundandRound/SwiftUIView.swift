//
//  SwiftUIView.swift
//  RoundandRound
//
//  Created by Joker on 2020/4/25.
//  Copyright © 2020 ntoucs. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var peterDegres: Double = 0
    
    func getPeterPosition(size: CGSize) -> CGPoint {
        let center = CGPoint(x: size.width/2, y: size.height/2)
        var path = Path()
        path.addArc(center: center, radius: 150, startAngle: .degrees(0), endAngle: .degrees(peterDegres), clockwise: false)
        return path.currentPoint ?? CGPoint.zero
    }
    var body: some View {
    GeometryReader { (geometry) in
        ZStack {
            Image(systemName: "heart.circle")
                .resizable()
                .frame(width: 300, height: 300)
                .overlay(
                    Text("only the young can run")
                        .font(.title)
                        .offset(y: -50)
                    , alignment: .top)
                .overlay(
                    VStack {
                        Slider(value: self.$peterDegres, in: 0...360)
                        Text("\(Int(self.peterDegres))")
                    }
                    .offset(y: 100)
                    .font(.title),
                    alignment: .bottom
            )
            
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .position(self.getPeterPosition(size: geometry.size))
            
        }
    }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
