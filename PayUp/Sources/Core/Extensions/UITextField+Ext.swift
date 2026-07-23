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
}
