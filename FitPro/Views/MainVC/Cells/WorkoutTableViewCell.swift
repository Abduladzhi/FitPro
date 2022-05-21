//
//  WorkoutTableViewCell.swift
//  FitPro
//
//  Created by Abduladzhi on 22.05.2022.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: WorkoutTableViewCell.self)
    
    private let backgroundCell: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .specialBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "imageCell")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label .text = "Pull Ups"
        label.textColor = .specialBlack
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 10"
        label.textColor = .specialGray
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
      let label = UILabel()
        label.text = "Sets: 10"
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        addSubview(workoutImageView)
        addSubview(startButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundCell.heightAnchor.constraint(equalToConstant: 97),
            
        ])
        
        NSLayoutConstraint.activate([
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 77),
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            workoutImageView.heightAnchor.constraint(equalToConstant: 63),
            workoutImageView.widthAnchor.constraint(equalToConstant: 56),
            workoutImageView.centerYAnchor.constraint(equalTo: workoutBackgroundView.centerYAnchor),
            workoutImageView.centerXAnchor.constraint(equalTo: workoutBackgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 29),
            startButton.widthAnchor.constraint(equalToConstant: 255),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            startButton.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -10)
        ])
    }
    
}
