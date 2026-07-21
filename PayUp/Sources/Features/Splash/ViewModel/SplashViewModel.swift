//
//  SplashViewModel.swift
//  PayUp
//
//  Created by Ronan Fernandes on 20/07/26.
//

import Foundation

final class SplashViewModel {
    
    var onAnimationCompleted: (() -> Void)?
    
    func performAnimation(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            completion()
        }
    }
}
