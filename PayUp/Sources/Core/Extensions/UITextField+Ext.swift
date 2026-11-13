//
//  UITextField+Ext.swift
//  PayUp
//
//  Created by Ronan Fernandes on 23/07/26.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingsPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func maskDate() {
        let cleanDate = (text ?? "")
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
        let mask = "##/##/####"
        self.text = applyMask(mask: mask, to: cleanDate)
    }
    
    private func applyMask(mask: String, to value: String) -> String {
        var result = ""
        var index = value.startIndex
        for ch in mask where index < value.endIndex {
            if ch == "#" {
                result.append(value[index])
                index = value.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
}
