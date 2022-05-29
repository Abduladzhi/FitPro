//
//  NewWorkoutViewController.swift
//  FitPro
//
//  Created by Abduladzhi on 22.05.2022.
//

import UIKit
import RealmSwift

class NewWorkoutViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
    
//    let textFieldLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Name"
//        label.textColor = .specialLightBrown
//        label.font = .robotoMedium14()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
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
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimer = RepsOrTimerView()
    
    private let localeRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    
    private let testImage = UIImage(named: "imageCell")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setDelegates()
        addTaps()
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func saveButtonTapped() {
//        RealmManager.shared.saveWorkOutModel(model: workoutModel)
        setModel()
        saveModel()
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func setDelegates() {
        textField.delegate = self
    }
    
    @objc private func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    private func setModel() {
        guard let nameWorkout = textField.text else { return }
        workoutModel.workoutName = nameWorkout
        workoutModel.workoutDate = dateAndRepeatView.datePicker.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: dateAndRepeatView.datePicker.date)
        guard let weekday = components.weekday else { return }
        workoutModel.workoutNumberOfDay = weekday
        workoutModel.workoutPepeat = (dateAndRepeatView.repeatSwith.isOn ? true : false)
        
        workoutModel.workoutSets = Int(repsOrTimer.setsSlider.value)
        workoutModel.workoutReps = Int(repsOrTimer.repsSlider.value)
        workoutModel.workoutTimer = Int(repsOrTimer.timerSlider.value)
        
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
        
    }
    
    private func saveModel() {
        guard let text = textField.text else { return }
        let count = text.filter { $0.isNumber || $0.isLetter}.count
        if count != 0 && workoutModel.workoutSets != 0 && (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkOutModel(model: workoutModel)
            workoutModel = WorkoutModel()
            dismiss(animated: true)
        } else {
            alertOk(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func setViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(scrollView)
        scrollView.addSubview(newWorkoutLabel)
        scrollView.addSubview(closeButton)
//        scrollView.addSubview(textFieldLabel)
        scrollView.addSubview(textField)
        scrollView.addSubview(nameDateAndRepeatLabel)
        scrollView.addSubview(dateAndRepeatView)
        scrollView.addSubview(repsOrTimerLabel)
        scrollView.addSubview(repsOrTimer)
        scrollView.addSubview(saveButton)
    }

// MARK: SetConstraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            newWorkoutLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
//            closeButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -21),
            closeButton.leadingAnchor.constraint(equalTo: newWorkoutLabel.trailingAnchor, constant: 10),
            
            textField.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
//            
            textField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 2),
            textField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 21),
            textField.heightAnchor.constraint(equalToConstant: 38),
            
            nameDateAndRepeatLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            nameDateAndRepeatLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
            
            dateAndRepeatView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 21),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93),
            dateAndRepeatView.topAnchor.constraint(equalTo: nameDateAndRepeatLabel.bottomAnchor, constant: 1),
            
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
            
            repsOrTimer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            repsOrTimer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 21),
            repsOrTimer.heightAnchor.constraint(equalToConstant: 275),
            repsOrTimer.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 1),
            
            saveButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: repsOrTimer.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 21),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }
}

extension NewWorkoutViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
