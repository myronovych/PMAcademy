//
//  ProfileVC.swift
//  BeyondLimits
//
//  Created by Oleksandr Myronovych on 20.12.2020.
//

import UIKit

class ProfileVC: UIViewController {
    
    var username: String!
    
    let avatarImageView = UIImageView(image: UIImage(named: "Face"))
    let nameLabel = UILabel()
    let bioLabel = UILabel()
    let videoStatsView = UIView()
    let gamesStatsView = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureAvatar()
        configureNameLabel()
        configureBioLabel()
        configureVideosStats()
        configureGamesStats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        configureDoneButton()
    }
    
    private func configureDoneButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(popVC))
        button.tintColor = .red
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func popVC() {
        dismiss(animated: true)
    }
    
    private func configureAvatar() {
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.layer.cornerRadius = 65
        avatarImageView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
    }
    
    private func configureNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = username
        nameLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        nameLabel.textAlignment = .center
        
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func configureBioLabel() {
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bioLabel.text = "Player enthusiast"
        
        bioLabel.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        bioLabel.textAlignment = .center
        bioLabel.textColor = .lightGray
        
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureVideosStats() {
        view.addSubview(videoStatsView)
        videoStatsView.translatesAutoresizingMaskIntoConstraints = false
        
        let videoStatsVC = VideosVC()
        add(childVC: videoStatsVC, to: self.videoStatsView)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            videoStatsView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor),
            videoStatsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            videoStatsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            videoStatsView.heightAnchor.constraint(equalToConstant: 135)
        ])
    }
    
    private func configureGamesStats() {
        view.addSubview(gamesStatsView)
        gamesStatsView.translatesAutoresizingMaskIntoConstraints = false
        
        let gameStatsVC = GamesVC()
        add(childVC: gameStatsVC, to: self.gamesStatsView)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            gamesStatsView.topAnchor.constraint(equalTo: videoStatsView.bottomAnchor, constant: padding),
            gamesStatsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            gamesStatsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            gamesStatsView.heightAnchor.constraint(equalToConstant: 135)
        ])
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
}
