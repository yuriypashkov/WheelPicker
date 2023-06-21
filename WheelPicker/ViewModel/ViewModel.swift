//
//  ViewModel.swift
//  WheelPicker
//
//  Created by Yuriy Pashkov on 17.02.2023.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var array: [String] = ["0", "1", "2", "3", "4", "A", "B", "C", "D", "E"]
    @Published var degree: Double = 90.0
    
}
