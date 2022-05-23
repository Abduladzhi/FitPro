//
//  WeatherView.swift
//  FitPro
//
//  Created by Abduladzhi on 21.05.2022.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    private let weatherLabel: UILabel = {
       let label = UILabel()
        label.text = "Солнечно"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDescriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 2
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherLabel)
        addSubview(weatherDescriptionLabel)
        addSubview(image)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            weatherLabel.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -10),
            weatherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 0),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -6),
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            image.heightAnchor.constraint(equalToConstant: 62),
            image.widthAnchor.constraint(equalToConstant: 62),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        
        ])
    }
    
}
