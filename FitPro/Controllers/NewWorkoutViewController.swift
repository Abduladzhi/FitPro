//
//  NewWorkoutViewController.swift
//  FitPro
//
//  Created by Abduladzhi on 22.05.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialDarkGreen
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nameTextField: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .specialBrown
        textField.layer.cornerRadius = 10
        textField.borderStyle = .none
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameDateAndRepeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Date and repeat"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repsOrTimerLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps or timer"
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimer = RepsOrTimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    
    @objc private func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    private func setViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameTextField)
        view.addSubview(textField)
        view.addSubview(nameDateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimer)
        view.addSubview(saveButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),

            nameTextField.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
//            
            textField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 2),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            textField.heightAnchor.constraint(equalToConstant: 38),
            
            nameDateAndRepeatLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            nameDateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            dateAndRepeatView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93),
            dateAndRepeatView.topAnchor.constraint(equalTo: nameDateAndRepeatLabel.bottomAnchor, constant: 1),
            
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            repsOrTimer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repsOrTimer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            repsOrTimer.heightAnchor.constraint(equalToConstant: 275),
            repsOrTimer.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 1),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: repsOrTimer.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
}
