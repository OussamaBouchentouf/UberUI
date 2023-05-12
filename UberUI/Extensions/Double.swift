//
//  Double.swift
//  UberUI
//
//  Created by Robotics on 10/5/2023.
//

import Foundation

extension Double {
    private var currentFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func toCurrency() -> String {
        return currentFormatter.string(for: self) ?? ""
    }
}
