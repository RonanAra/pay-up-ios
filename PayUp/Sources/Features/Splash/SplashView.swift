//
//  SplashView.swift
//  PayUp
//
//  Created by Ronan Fernandes on 20/07/26.
//

import UIKit
import Foundation

final class SplashView: UIView {
    
    let triangleImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "animatedSplashTriangle"))
        image.contentMode = .scaleAspectFill
        image.alpha = 0
        return image
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "mainLogo"))
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.backgroundPrimary
        addSubview(triangleImageView)
        addSubview(logoImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        triangleImageView.frame = bounds
        logoImageView.center = center
        logoImageView.bounds.size = CGSize(width: 100, height: 100)
    }
}
