//
//  AppTextView.swift
//  Pickapp&Go
//
//  Created by Mikhail Semerikov on 01.06.2020.
//  Copyright © 2020 Mikhail Semerikov. All rights reserved.
//

import Combine
import UIKit

class AppTextView: UIView, UITextViewDelegate {
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
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.delegate = self
        textView.font = .systemFontOfSize(size: 16)
        textView.layer.cornerRadius = textFieldCornerRadius
        textView.text = text
        textView.textColor = UIColor.placeholderColor
        return textView
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
        textView.layer.addSublayer(innerShadow)
        return innerShadow
    }()
    
    lazy var innerShadow2: CALayer = {
        let innerShadow = CALayer()
        textView.layer.addSublayer(innerShadow)
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
                textView.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
                textView.layer.borderWidth = 2
            case .inactive:
                label.isHidden = true
                label.textColor = .labelColor
                errorLabel.isHidden = true
                errorLabel.textColor = .errorTextFieldBorderColor
                textView.layer.borderColor = UIColor.inactiveTextFieldBorderColor.cgColor
                textView.layer.borderWidth = 1
            case .error:
                label.isHidden = false
                label.textColor = .errorTextFieldBorderColor
                errorLabel.isHidden = false
                errorLabel.textColor = .errorTextFieldBorderColor
                textView.layer.borderColor = UIColor.errorTextFieldBorderColor.cgColor
                textView.layer.borderWidth = 2
            }
        }
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextView.textDidChangeNotification, object: self.textView)
            .compactMap { $0.object as? UITextView } // receiving notifications with objects which are instances of UITextFields
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
        innerShadow1.frame = textView.bounds
        innerShadow2.frame = textView.bounds

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
        [textView, label, errorLabel]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setUpConstraints() {
        let textViewConstraints = [
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            textView.heightAnchor.constraint(equalToConstant: 88)
        ]
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
//            label.widthAnchor.constraint(equalToConstant: text.width(withConstrainedHeight: 16, font: font)),
            label.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let errorLabelConstraints = [
            errorLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 3),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            errorLabel.widthAnchor.constraint(equalToConstant: error.width(withConstrainedHeight: 16, font: font)),
            errorLabel.heightAnchor.constraint(equalToConstant: 16)
        ]

        [textViewConstraints,
         labelConstraints,
         errorLabelConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Ваше обращение" {
            textView.text = ""
            textView.textColor = UIColor.labelColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = text
            textView.textColor = UIColor.placeholderColor
        }
    }
    
}

