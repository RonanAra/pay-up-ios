//
//  CurrencyTextField.swift
//  PayUp
//
//  Created by Ronan Fernandes on 02/10/26.
//

import UIKit

final class CurrencyTextField: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = Colors.backgroundTertiary
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.borderPrimary.cgColor
        textField.font = Fonts.paragraphMedium()
        textField.textColor = Colors.textLabel
        textField.setLeftPaddingsPoints(12)
        textField.rightViewMode = .always
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 43),
            textField.widthAnchor.constraint(equalToConstant: 200)
        ])
        return textField
    }()
    
    private let currencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BRL ▼", for: .normal)
        button.titleLabel?.font = Fonts.paragraphMedium()
        button.setTitleColor(Colors.textLabel, for: .normal)
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        textField.rightView = currencyButton
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [.foregroundColor: Colors.textPlaceholder])
        setupStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStack() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, textField])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.disableAutoresizingMaskTranslation()
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func getText() -> String? {
        textField.text
    }
    
    func setText(_ v: String) {
        textField.text = v
    }
}
