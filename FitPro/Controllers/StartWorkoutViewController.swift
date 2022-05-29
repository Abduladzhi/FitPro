//
//  StartWorkoutViewController.swift
//  FitPro
//
//  Created by Abduladzhi on 29.05.2022.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private let nameViewLabel: UILabel = {
       let label = UILabel()
        label.text = "START WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialDarkGreen
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let noWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noWorkout")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    @objc private func tappedCloseButton() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(nameViewLabel)
        view.addSubview(closeButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            nameViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
