//
//  BeyondLimitsVC.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 19.12.2020.
//

import UIKit

class BeyondLimitsVC: UIViewController {
    
    let ballImageView = UIImageView(image: UIImage(named: "Ball"))
    let beyondLimitsLabel = UILabel()
    let textField = UITextField()
    let giveDetailsButton = MainButton(title: "Give me some details", backgroundColor: .red, height: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setBallImageView()
        setBeyondLimitsLabel()
        setTextField()
        setGiveDetailsButton()
        giveDetailsButton.addTarget(nil, action: #selector(pressedButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func pressedButton() {
        guard let username = textField.text, !username.isEmpty else {
            //alert here
            return
        }
        let destVC = ProfileVC()
        destVC.username = username
        present(UINavigationController(rootViewController: destVC), animated: true)
    }
    
    private func setBallImageView() {
        view.addSubview(ballImageView)
        ballImageView.translatesAutoresizingMaskIntoConstraints = false
        
        ballImageView.contentMode = .scaleAspectFit
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            ballImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            ballImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            ballImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setBeyondLimitsLabel() {
        view.addSubview(beyondLimitsLabel)
        beyondLimitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        beyondLimitsLabel.text = LocalizedStrings.beyondLimits
        beyondLimitsLabel.adjustsFontSizeToFitWidth = true
        beyondLimitsLabel.minimumScaleFactor = 14
        beyondLimitsLabel.font = UIFont.boldSystemFont(ofSize: 40)
        beyondLimitsLabel.textAlignment = .center
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            beyondLimitsLabel.topAnchor.constraint(equalTo: ballImageView.bottomAnchor, constant: padding),
            beyondLimitsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            beyondLimitsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = LocalizedStrings.enterUsername
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 25)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: beyondLimitsLabel.bottomAnchor, constant: padding),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func setGiveDetailsButton() {
        view.addSubview(giveDetailsButton)
        
        giveDetailsButton.setTitle(LocalizedStrings.giveDetails, for: .normal)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            giveDetailsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            giveDetailsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            giveDetailsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
}

