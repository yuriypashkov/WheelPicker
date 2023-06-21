//
//  WheelView.swift
//  WheelPicker
//
//  Created by Yuriy Pashkov on 17.02.2023.
//

import SwiftUI

struct WheelView: View {
    
    @State var radius: Double = 150
    @State var direction: Direction = .left
    
    @Binding var choosenIndex: Int
    @Binding var degree: Double
    
    var values: [String]
    var circleSize: Double
    
    var body: some View {
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(values.count)
            // check drag direction
            let dragGesture = DragGesture()
                .onEnded { value in
                    if value.startLocation.x > value.location.x + 10 {
                        direction = .left
                    } else if value.startLocation.x < value.location.x - 10 {
                        direction = .right
                    }
                    // move wheel
                    moveWheel()
                }
            // wheel stack
            ZStack {
                Circle().fill(.linearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom))
                    .hueRotation(Angle.degrees(degree))
                
                ForEach(0..<values.count, id: \.self) { index in
                    let angle = Double(index) * anglePerCount
                    let xOffset = CGFloat(radius * cos(angle))
                    let yOffset = CGFloat(radius * sin(angle))
                    Text(values[index])
                        .rotationEffect(Angle(degrees: -degree))
                        .offset(x: xOffset, y: yOffset)
                        .font(Font.system(choosenIndex == index ? .title : .body, design: .monospaced))
                }
            }
            .rotationEffect(Angle(degrees: degree))
            .gesture(dragGesture)
            .onAppear {
                radius = circleSize / 2 - 16
            }
            // wheel stack ended
        }.frame(width: circleSize, height: circleSize)
    }
    
    private func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                // rotate to left
                degree += Double(360/values.count)
                if choosenIndex == 0 {
                    choosenIndex = values.count - 1
                } else {
                    choosenIndex -= 1
                }
            } else {
                // rotate to right
                degree -= Double(360/values.count)
                if choosenIndex == values.count - 1 {
                    choosenIndex = 0
                } else {
                    choosenIndex += 1
                }
            }
        }
    }
}

//struct WheelView_Previews: PreviewProvider {
//    static var previews: some View {
//        WheelView()
//    }
//}
