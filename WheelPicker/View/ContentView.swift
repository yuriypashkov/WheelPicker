//
//  ContentView.swift
//  WheelPicker
//
//  Created by Yuriy Pashkov on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel: ViewModel = ViewModel()
    @State var selectedIndex: Int = 0
    
    var body: some View {
            ZStack(alignment: .center, content: {
                Color.orange.opacity(0.4)
                    .hueRotation(Angle(degrees: viewModel.degree))
                
                VStack {
                    WheelView(choosenIndex: $selectedIndex, degree: $viewModel.degree, values: viewModel.array, circleSize: 400)
                        .offset(y: -350)
                        .shadow(color: .gray, radius: 4, x: 0, y: 0)
                    
                    Text("Selected value is \(viewModel.array[selectedIndex])")
                }
                
            }).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
