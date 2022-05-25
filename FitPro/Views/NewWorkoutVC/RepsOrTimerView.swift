//
//  RepsOrTimerView.swift
//  FitPro
//
//  Created by Abduladzhi on 22.05.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    let nameSets: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberSets: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.tintColor = .specialGreen
        slider.addTarget(self, action: #selector(setsChangetSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let chooseRepeat: UILabel = {
        let label = UILabel()
        label.text = "Choose Repeat or timer"
        label.textAlignment = .center
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameReps: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberReps: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repsSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .specialGreen
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(repsChangetSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let nameTimer: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberTimer: UILabel = {
        let label = UILabel()
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timerSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .specialGreen
        slider.minimumValue = 1
        slider.maximumValue = 600
        slider.addTarget(self, action: #selector(timerChangetSlider), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func setsChangetSlider() {
        numberSets.text = "\(Int(setsSlider.value))"
    }
    
    @objc private func repsChangetSlider() {
        numberReps.text = "\(Int(repsSlider.value))"
        setNegative(label: nameTimer, number: numberTimer, slider: timerSlider)
        setActive(label: nameReps, number: numberReps, slider: repsSlider)
    }
    
    @objc private func timerChangetSlider() {
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return ((secs % 3600) / 60, (secs % 3600) % 60)}(Int(timerSlider.value))
        numberTimer.text = sec != 0 ? "\(min) min \(sec) sec" : "\(min) min"
        setNegative(label: nameReps, number: numberReps, slider: repsSlider)
        setActive(label: nameTimer, number: numberTimer, slider: timerSlider)
    }
    
    private func setActive(label: UILabel, number: UILabel, slider: UISlider) {
        label.alpha = 1
        number.alpha = 1
        slider.alpha = 1
    }
    
    private func setNegative(label: UILabel, number: UILabel, slider: UISlider) {
        label.alpha = 0.5
        label.text = "0"
        number.alpha = 0.5
        slider.alpha = 0.5
        slider.value = 0
    }
    
    private func setViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        setsStackView = UIStackView(arrangedSubviews: [nameSets, numberSets], axis: .horizontal, spacing: 200)
        repsStackView = UIStackView(arrangedSubviews: [nameReps, numberReps], axis: .horizontal, spacing: 200)
        timerStackView = UIStackView(arrangedSubviews: [nameTimer, numberTimer], axis: .horizontal, spacing: 100)
        addSubview(setsStackView)
        addSubview(setsSlider)
        addSubview(chooseRepeat)
        addSubview(repsStackView)
        addSubview(repsSlider)
        addSubview(timerStackView)
        addSubview(timerSlider)
    }
    
    //MARK: SetConstraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            setsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),

            setsSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 11),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            chooseRepeat.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseRepeat.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 20),

            repsStackView.topAnchor.constraint(equalTo: chooseRepeat.bottomAnchor, constant: 1),
            repsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            repsSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 11),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 10),
            timerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            timerSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
}
