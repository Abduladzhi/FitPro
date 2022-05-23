//
//  DateAndRepeatView.swift
//  FitPro
//
//  Created by Abduladzhi on 22.05.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.textColor = .specialDarkGreen
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let repeatSwith: UISwitch = {
        let repeatSwith = UISwitch()
        repeatSwith.onTintColor = .specialGreen
        repeatSwith.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwith
    }()
    
    var dateStackView = UIStackView()
    var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstarints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setViews() {
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        dateStackView = UIStackView(arrangedSubviews: [dateLabel, datePicker], axis: .horizontal, spacing: 10)
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repeatSwith], axis: .horizontal, spacing: 10)
        addSubview(dateStackView)
        addSubview(repeatStackView)
    }
    private func setConstarints() {
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            dateStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),

            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 7),
            repeatStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
        ])
    }
}
