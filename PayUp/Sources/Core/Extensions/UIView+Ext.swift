//
//  UIView+Ext.swift
//  PayUp
//
//  Created by Ronan Fernandes on 18/07/26.
//

import Foundation
import UIKit

extension UIView {
    func animateMoveOut(to point: CGPoint, duration: TimeInterval) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseInOut
        ) {
            self.center = point
            self.alpha = 0
        }
    }
    
    func disableAutoresizingMaskTranslation() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
