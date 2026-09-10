//
//  PaymentCardView.swift
//  PayUp
//
//  Created by Ronan Fernandes on 09/09/26.
//

import Foundation
import UIKit

final class PaymentCardView: UIView {
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundSecondary
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "calendarDollar"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.accentOrange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "A Receber"
        label.font = Fonts.paragraphSmall()
        label.textColor = Colors.textParagraph
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.paragraphMedium()
        label.textColor = Colors.textParagraph
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(container)
        container.addSubview(iconImageView)
        container.addSubview(subtitleLabel)
        container.addSubview(nameLabel)
        container.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            iconImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            subtitleLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            
            nameLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32),
            
            valueLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            valueLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value
    }
}
