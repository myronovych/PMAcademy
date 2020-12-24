//
//  AlertViewController.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 24.12.2020.
//

import UIKit

class AlertViewController: UIViewController {

    let containerView = AlertContainerView()
    let titleLabel = BLTitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel = UILabel()
    let actionButton = BLMainButton(title: "OK", backgroundColor: .red, height: 44)
    
    var titleText: String?
    var bodyText: String?
    var buttonText: String?
    
    let padding: CGFloat = 20.0
    
    init(titleText: String, message: String, buttonText: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.titleText = titleText
        self.bodyText = message
        self.buttonText = buttonText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        
        configureContainer()
        configureTitleLabel()
        configureButton()
        configureBodyLabel()
    }
    
    private func configureContainer() {
        view.addSubview(containerView)
        

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = titleText ?? "Smthn went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureButton() {
        containerView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.titleLabel?.text = buttonText
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureBodyLabel() {
        containerView.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyLabel.text = bodyText
        bodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
