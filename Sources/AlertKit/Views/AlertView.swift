//
//  AlertView.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

//
//  AlertView.swift
//
//
//  Created by MohammadReza Ansary on 2/8/22.
//

import UIKit
import SwiftMessages
import ExtensionKit

class AlertView: UIView, AlertViewConfigurable {
    
    var configuration: SwiftMessages.Config
    
    
    // MARK: - Subviews
    private let mainStack = UIStackView() .. {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    private let trailingStack = UIStackView() .. {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    private let buttonSpacesView = UIView() .. {
        $0.backgroundColor = .clear
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
        $0.isHidden = true
    }
    
    let imageSpaceView = UIView() .. {
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
        $0.backgroundColor = .clear
        $0.isHidden = false
    }
    
    private let buttonsStack = UIStackView() .. {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 16
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.semanticContentAttribute = .forceLeftToRight
        $0.isHidden = true
    }
    
    private let titleLabel = UILabel() .. {
        $0.textAlignment = .center
    }
    
    private let subtitleLabel = UILabel() .. {
        $0.textAlignment = .center
    }
    
    private let imageView = UIImageView() .. {
        $0.heightAnchor.constraint(equalToConstant: 112).isActive = true
        $0.isHidden = true
    }
    
    private var cornerRadius: CGFloat = 12 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
    // MARK: - Input
    private var title: String? {
        get { titleLabel.text }
        set {
            titleLabel.text = newValue
            titleLabel.isHidden = newValue?.isEmpty ?? true
        }
    }
    
    private var subtitle: String? {
        get { subtitleLabel.text }
        set {
            subtitleLabel.text = newValue
            subtitleLabel.isHidden = newValue?.isEmpty ?? true
        }
    }
    
//    private var image: String? {
//        didSet {
//            Image.remote(image, placeholder: nil, size: .automatic).setImage(for: imageView)
//            imageView.isHidden = image == nil
//            imageSpaceView.isHidden = image == nil
//        }
//    }
    
    private var actions: [AlertAction]? {
        get { fatalError("Action is write-only.") }
        set {
            guard let newValue = newValue, !newValue.isEmpty else { return }
            buttonsStack.arrangedSubviews.forEach({ $0.removeFromSuperview() })
            buttonsStack.isHidden = false
            buttonSpacesView.isHidden = false
            
            newValue
                .map { createButton(with: $0) }
                .forEach { buttonsStack.addArrangedSubview($0) }
        }
    }
    
    private var theme: AlertTheme {
        get { fatalError("Theme is write-only.") }
        set {
            backgroundColor = newValue.backgroundColor
            
            titleLabel.textColor = newValue.title.color
            titleLabel.font = newValue.title.font
            titleLabel.numberOfLines = newValue.title.lineNumber
            
            subtitleLabel.textColor = newValue.message.color
            subtitleLabel.font = newValue.message.font
            subtitleLabel.numberOfLines = newValue.message.lineNumber
            
            imageView.backgroundColor = newValue.image.backgroundColor
            imageView.contentMode = newValue.image.contentMode
        }
    }

    public init(_ model: AlertModel, _ alertTheme: AlertTheme, isCancelable: Bool) {
        configuration = SwiftMessages.defaultConfig
        super.init(frame: .zero)
        configuration.dimMode = .gray(interactive: isCancelable)
        configuration.interactiveHide = false
        configuration.presentationContext = .window(windowLevel: .statusBar)
        configuration.presentationStyle = .center
        title = model.title
        subtitle = model.message
//        image = model.image
        actions = model.actions
        theme = alertTheme
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        layer.cornerRadius = cornerRadius
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        trailingStack.addArrangedSubview(imageView)
        trailingStack.addArrangedSubview(imageSpaceView)
        trailingStack.addArrangedSubview(titleLabel)
        trailingStack.addArrangedSubview(subtitleLabel)
        trailingStack.addArrangedSubview(buttonSpacesView)
        trailingStack.addArrangedSubview(buttonsStack)
        
        mainStack.addArrangedSubview(trailingStack)
        
        addSubview(mainStack)
    }
    
    private func setConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        mainStack.center = center
    }
    
    private func createButton(with action: AlertAction) -> UIButton {
        let theme = action.style.theme
        return UIButton() .. {
            $0.backgroundColor = theme.backgroundColor
            $0.setTitle(action.title, for: .normal)
            $0.setTitleColor(theme.title.color, for: .normal)
            $0.titleLabel?.font = theme.title.font
            $0.titleLabel?.numberOfLines = 1
            $0.titleLabel?.adjustsFontSizeToFitWidth = true
            $0.titleLabel?.lineBreakMode = .byWordWrapping
            
            $0.layer.cornerRadius = 8
            $0.titleEdgeInsets = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4)
            if #available(iOS 13.0, *) { $0.layer.cornerCurve = .continuous }
            
            $0.addAction(for: .touchUpInside) { action.handler?() }
        }
    }
}

extension AlertView: Presentable {
    func present(style: Alert.Style, for time: TimeInterval) {
        self.configuration.duration = (time == .infinity || style == .alert) ? .forever : .seconds(seconds: time)
        SwiftMessages.show(config: self.configuration, view: self.baseView(from: self))
    }
}

extension AlertView: Dismissible {
    func dismiss() {
        SwiftMessages.hide()
    }
}

