//
//  AppTextField.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 06.05.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

enum StatusTextField {
    case inactive
    case active
    case error
}

class AppTextField: UIView {
    let font = UIFont.systemFontOfSize(size: 12)
    var text = ""
    var error = ""
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = font
        label.text = text
        label.textAlignment = .left
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        textField.backgroundColor = .white
        textField.layer.cornerRadius = textFieldCornerRadius
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 16,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = text
        textField.textColor = .labelColor
        textField.font = .systemFontOfSize(size: 16)
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = font
        label.text = error
        label.textAlignment = .left
        return label
    }()
    
    lazy var innerShadow1: CALayer = {
        let innerShadow = CALayer()
        textField.layer.addSublayer(innerShadow)
        return innerShadow
    }()
    
    lazy var innerShadow2: CALayer = {
        let innerShadow = CALayer()
        textField.layer.addSublayer(innerShadow)
        return innerShadow
    }()
    
    var status: StatusTextField {
        get {
            return .inactive
        }
        set {
            switch newValue {
            case .active:
                label.isHidden = false
                label.textColor = .labelColor
                errorLabel.isHidden = true
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
                textField.layer.borderWidth = 2
            case .inactive:
                label.isHidden = true
                label.textColor = .labelColor
                errorLabel.isHidden = true
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
                textField.layer.borderWidth = 1
            case .error:
                label.isHidden = false
                label.textColor = .errorTextFieldBorderColor
                errorLabel.isHidden = false
                errorLabel.textColor = .errorTextFieldBorderColor
                textField.layer.borderColor = UIColor.errorTextFieldBorderColor.cgColor
                textField.layer.borderWidth = 2
            }
        }
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self.textField)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .map { $0.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
    
    convenience init(title: String, error: String) {
        self.init()
        self.text = title
        self.error = error
        addSubviews()
        setUpConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyDesign()
    }
    
    func applyDesign() {
        innerShadow1.frame = textField.bounds
        innerShadow2.frame = textField.bounds

        // Shadow path (1pt ring around bounds)
        let radius = 12.f
        let path1 = UIBezierPath(roundedRect: innerShadow1.bounds.insetBy(dx: -1, dy:-1), cornerRadius: radius)
        let cutout1 = UIBezierPath(roundedRect: innerShadow1.bounds, cornerRadius: radius).reversing()
        let path2 = UIBezierPath(roundedRect: innerShadow2.bounds.insetBy(dx: -1, dy:-1), cornerRadius: radius)
        let cutout2 = UIBezierPath(roundedRect: innerShadow2.bounds, cornerRadius: radius).reversing()

        path1.append(cutout1)
        path2.append(cutout2)
        innerShadow1.shadowPath = path1.cgPath
        innerShadow2.shadowPath = path2.cgPath
        innerShadow1.masksToBounds = true
        innerShadow2.masksToBounds = true
        // Shadow properties
        innerShadow1.shadowColor = UIColor.white.cgColor
        innerShadow1.shadowOffset = CGSize(width: -3, height: -3)
        innerShadow1.shadowOpacity = 1
        innerShadow1.shadowRadius = 2
        innerShadow1.cornerRadius = 12
        
        innerShadow2.shadowColor = UIColor(red: 136 / 255, green: 165 / 255, blue: 191 / 255, alpha: 0.38).cgColor  //rgb(136,165,191).darkGray.cgColor
        innerShadow2.shadowOffset = CGSize(width: 2, height: 2)
        innerShadow2.shadowOpacity = 1
        innerShadow2.shadowRadius = 2
        innerShadow2.cornerRadius = 12
    }
    
    private func addSubviews() {
        [textField, label, errorLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let textFieldConstraints = [
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ]
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
//            label.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: 16, font: font)),
            label.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let errorLabelConstraints = [
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 3),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            errorLabel.widthAnchor.constraint(equalToConstant: error.width(withConstrainedHeight: 16, font: font)),
            errorLabel.heightAnchor.constraint(equalToConstant: 16)
        ]

        [textFieldConstraints,
         labelConstraints,
         errorLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
}
