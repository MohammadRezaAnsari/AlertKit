//
//  BannerView.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit
import SwiftMessages
import ExtensionKit

class BannerView: UIView, AlertViewConfigurable {

    var configuration: SwiftMessages.Config
    
    // MARK: - Subviews
    private let mainStack = UIStackView() .. {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    private let leadingStack = UIStackView() .. {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fill
        $0.spacing = 2
        $0.isHidden = true
    }
    
    private let trailingStack = UIStackView() .. {
        $0.axis = .vertical
        $0.alignment = .top
        $0.distribution = .fill
        $0.spacing = 4
    }
    
    private let titleLabel = UILabel() .. {
        $0.textAlignment = .natural
    }
    
    private let subtitleLabel = UILabel() .. {
        $0.textAlignment = .natural
    }
    
    private let imageView = UIImageView() .. {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.contentMode = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 32).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private let button = UIButton() .. {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    
    // TODO: Support image
//    private var image: String? {
//        didSet {
//            Image.remote(image, placeholder: nil, size: .automatic).setImage(for: imageView)
//            imageView.isHidden = image == nil
//            leadingStack.isHidden = image == nil
//        }
//    }
    
    private var action: AlertAction? {
        get { fatalError("Action is write-only.") }
        set {
            button.addAction(for: .touchUpInside) { newValue?.handler?() }
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
        title = model.title
        subtitle = model.message
//        image = model.image
        action = model.actions.last
        theme = alertTheme
        configuration.interactiveHide = isCancelable
        configuration.dimMode = .none
        configuration.presentationContext = .window(windowLevel: .statusBar)
        if #available(iOS 13.0, *) { imageView.layer.cornerCurve = .continuous }
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
        trailingStack.addArrangedSubview(titleLabel)
        trailingStack.addArrangedSubview(subtitleLabel)
        
        leadingStack.addArrangedSubview(imageView)
        leadingStack.addArrangedSubview(UIView())
        
        mainStack.addArrangedSubview(trailingStack)
        mainStack.addArrangedSubview(leadingStack)
        
        addSubview(mainStack)
        addSubview(button)
    }
    
    private func setConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        mainStack.center = center
        
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

extension BannerView: Presentable {
    func present(style: Alert.Style, for time: TimeInterval) {
        self.configuration.duration = (time == .infinity || style == .alert) ? .forever : .seconds(seconds: time)
        SwiftMessages.show(config: self.configuration, view: self.baseView(from: self))
    }
}

extension BannerView: Dismissible {
    func dismiss() {
        SwiftMessages.hide()
    }
}

