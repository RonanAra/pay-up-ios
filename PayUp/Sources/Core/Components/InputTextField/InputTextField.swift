//
//  InputTextField.swift
//  PayUp
//
//  Created by Ronan Fernandes on 22/07/26.
//

import Foundation
import UIKit

final class CustomTextFieldView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        //label.font = Fonts.titleSmall()
        label.textColor = Colors.textHeading
        label.disableAutoresizingMaskTranslation()
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = Colors.backgroundPrimary
        textField.textColor = Colors.textLabel
        //textField.font = Fonts.paragraphMedium()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.borderPrimary.cgColor
        textField.setLeftPaddingsPoints(12)
        textField.disableAutoresizingMaskTranslation()
        return textField
    }()
    
    private var type: InputTextFieldType
    
    init(
        title: String,
        placeHolder: String,
        type: InputTextFieldType = .normal
    ) {
        self.type = type
        super.init(frame: .zero)
        setupView(placeHolder: placeHolder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(placeHolder: String) {
        addSubview(titleLabel)
        addSubview(textField)
        setupConstraints()
        setupTargets()
        setupTextFieldPlaceHolder(placeHolder: placeHolder)
    }
    
    private func setupTextFieldPlaceHolder(placeHolder: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [
                .foregroundColor: Colors.textPlaceholder,
                //.font: Fonts.paragraphSmall()
            ])
    }
    
    private func setupTargets() {
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc
    private func textDidChange() {
        switch type {
        case .normal:
            break
        case .cellphone:
            // mask Phone number
        case .cnpj:
            // mask Cnpj
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 39),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
