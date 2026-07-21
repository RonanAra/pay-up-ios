//
//  SplashViewController.swift
//  PayUp
//
//  Created by Ronan Fernandes on 20/07/26.
//

import UIKit
import Foundation

final class SplashViewController: UIViewController {
    
    private let viweModel: SplashViewModel
    private let splashView = SplashView()
    
    init(
        viewModel: SplashViewModel
    ) {
        self.viweModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view = splashView
        startAnimation()
    }
    
    private func startAnimation() {
        splashView.triangleImageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        viweModel.performAnimation { [ weak self ] in
            guard let self = self else { return }
            
            UIView.animate(
                withDuration: 0.8,
                animations: {
                    self.splashView.triangleImageView.alpha = 1
                    self.splashView.triangleImageView.transform = .identity
                },
                completion: {_ in
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0.3,
                        options: .curveEaseInOut
                    ) {
                        self.splashView.logoImageView.alpha = 1
                    } completion: { _ in
                        self.viweModel.onAnimationCompleted?()
                    }
                }
            )
        }
    }
}
