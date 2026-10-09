//
//  DatePickerTextField.swift
//  PayUp
//
//  Created by Ronan Fernandes on 02/10/26.
//

import UIKit

final class DatePickerTextField: UIView {
    
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
    
    private let calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = Colors.textLabel
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
        button.disableAutoresizingMaskTranslation()
        return button
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        
        titleLabel.text = title
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: Colors.textPlaceholder]
        )
        textField.rightView = calendarButton
        setupStack()
        
        calendarButton.addAction(.init(handler: {
            [weak self] _ in
            self?.presentDataPicker()
        }), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStack() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, textField])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func presentDataPicker() {
        let alert = UIAlertController(
            title: "\n\n\n\n\n\n\n\n",
            message: nil,
            preferredStyle: .actionSheet
        )
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.disableAutoresizingMaskTranslation()
        
        alert.view.addSubview(picker)
        NSLayoutConstraint.activate([
            picker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 8),
            picker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -8),
            picker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 8),
            picker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        alert.addAction(.init(title: "Ok", style: .default) { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            self.textField.text = dateFormatter.string(from: picker.date)
        })
        
        if let viewController = self.presentViewController() {
            viewController.present(alert, animated: true)
        }
    }
    
    func getText() -> String? {
        textField.text
    }
    
    func setText(_ text: String) {
        textField.text = text
    }
}
