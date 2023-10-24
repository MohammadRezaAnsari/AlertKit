//
//  FullScreenViewController.swift
//
//
//  Created by Mohammad Reza Ansary on 8/1/1402 AP.
//

import UIKit
import ExtensionKit
import Foundation

public class FullScreenViewController : UIViewController {
    
    private let mainStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
        $0.contentMode = .scaleToFill
        $0.layoutMargins = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let imageView = UIImageView() .. {
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
    }
    
    private let subStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.contentMode = .scaleToFill
        $0.spacing = 20
        $0.layoutMargins = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
        $0.isLayoutMarginsRelativeArrangement = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let messageTextView = UILabel() .. {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font =  UIFont.systemFont(ofSize: 24)
        $0.textColor = StyleTheme.shared.current.color.text.body.colorA
    }
    
    private let descriptionTextView = UILabel() .. {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font =  UIFont.systemFont(ofSize: 24)
        $0.textColor = StyleTheme.shared.current.color.text.body.colorA
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
    
    private var actions: [AlertAction]? {
        get { fatalError("Action is write-only.") }
        set {
            guard let newValue = newValue, !newValue.isEmpty else { return }
            buttonsStack.arrangedSubviews.forEach({ $0.removeFromSuperview() })
            buttonsStack.isHidden = false
            
            newValue
                .map { createButton(with: $0) }
                .forEach { buttonsStack.addArrangedSubview($0) }
        }
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
            if #available(iOS 13.0, *) { $0.layer.cornerCurve = .continuous }
            $0.addAction(for: .touchUpInside) { action.handler?() }
        }
    }
    
    // MARK: - Input
    private var navigationTitle: String? {
        get { navigationItem.title }
        set {
            navigationItem.title = newValue
        }
    }
    
    private var message: String? {
        get { messageTextView.text }
        set {
            messageTextView.text = newValue
        }
    }
    
    private var descriptionText: String? {
        get { descriptionTextView.text }
        set {
            descriptionTextView.text = newValue
        }
    }
    
    init(_ model: AlertModel) {
        super.init(nibName: nil, bundle: nil)
        self.navigationTitle = model.title
        self.message = model.message
        self.actions = model.actions
        self.descriptionText = model.description
//        Image.remote(model.image, placeholder: nil, size: .none).setImage(for: imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationItem.hidesBackButton = true
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        
        mainStackView.addArrangedSubview(imageView)
        subStackView.addArrangedSubview(messageTextView)
        subStackView.addArrangedSubview(descriptionTextView)
        subStackView.addArrangedSubview(buttonsStack)
        mainStackView.addArrangedSubview(subStackView)
        
        view.addSubview(mainStackView)
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        messageTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
//        guard let message = message else { return }
        descriptionTextView.attributedText = descriptionText?.withLineSpacing(12)
        descriptionTextView.textAlignment = .center
        
        descriptionTextView.font =  UIFont.systemFont(ofSize: 24)
        descriptionTextView.textColor = StyleTheme.shared.current.color.text.body.colorA
        
    }
}

extension FullScreenViewController: Presentable {
    public func present(style: Alert.Style, for time: TimeInterval) {
        if let topController = UIApplication().topViewController {
            topController.navigationController?.pushViewController(self, animated: true)
        }
    }
}

extension FullScreenViewController: Dismissible {
    public func dismiss() {
        navigationController?.popViewController(animated: true)
    }
}

