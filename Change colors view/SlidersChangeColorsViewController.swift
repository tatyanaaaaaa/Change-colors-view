//
//  SlidersChangeColorsViewController.swift
//  Change colors view
//
//  Created by Tatiana Sosina on 20.03.2022.
//

import UIKit

final class SlidersChangeColorsViewController: UIViewController {
    
    // MARK: - Public property

    public var slidersAction: ((UIColor?) -> Void)?
    
    // MARK: - Private property
    
    private let rectangleView = UIView()
    
    private let redLabel = UILabel()
    private let greenLabel = UILabel()
    private let blueLabel = UILabel()
    
    private let redValueLabel = UILabel()
    private let greenValueLabel = UILabel()
    private let blueValueLabel = UILabel()
    
    private let redSlider = UISlider()
    private let greenSlider = UISlider()
    private let blueSlider = UISlider()
    
    private let redTextField = UITextField()
    private let greenTextField = UITextField()
    private let blueTextField = UITextField()
    
    // MARK: - Internal func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDefaultSettings()
        setupConstraints()
        updateContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        slidersAction?(rectangleView.backgroundColor)
    }
    
    // MARK: - Private func
    
    @objc private func switchSliderAction() {
        updateContent()
    }
    
    private func setupDefaultSettings() {
        rectangleView.layer.cornerRadius = 14
        
        redLabel.text = "red:"
        greenLabel.text = "green:"
        blueLabel.text = "blue:"
        
        redSlider.thumbTintColor = .red
        redSlider.minimumTrackTintColor = .red
        redSlider.value = 0.5
        redSlider.addTarget(self, action: #selector(switchSliderAction), for: .valueChanged)
        
        greenSlider.thumbTintColor = .green
        greenSlider.minimumTrackTintColor = .green
        greenSlider.value = 0.7
        greenSlider.addTarget(self, action: #selector(switchSliderAction), for: .valueChanged)
        
        blueSlider.thumbTintColor = .blue
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.value = 0.5
        blueSlider.addTarget(self, action: #selector(switchSliderAction), for: .valueChanged)
        
        redTextField.borderStyle = .roundedRect
        greenTextField.borderStyle = .roundedRect
        blueTextField.borderStyle = .roundedRect
    }
    
    private func setupConstraints() {
        [rectangleView, redLabel, redValueLabel, redSlider, greenLabel,
         greenValueLabel, greenSlider, blueLabel, blueValueLabel, blueSlider,
        redTextField, greenTextField, blueTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view?.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            rectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rectangleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rectangleView.heightAnchor.constraint(equalToConstant: 170),
            
            redLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            redLabel.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 48),
            redLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            greenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 28),
            greenLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            blueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 28),
            blueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            redValueLabel.leadingAnchor.constraint(equalTo: redLabel.trailingAnchor, constant: 16),
            redValueLabel.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 48),
            redValueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            greenValueLabel.leadingAnchor.constraint(equalTo: greenLabel.trailingAnchor, constant: 16),
            greenValueLabel.topAnchor.constraint(equalTo: redValueLabel.bottomAnchor, constant: 28),
            greenValueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            blueValueLabel.leadingAnchor.constraint(equalTo: blueLabel.trailingAnchor, constant: 16),
            blueValueLabel.topAnchor.constraint(equalTo: greenValueLabel.bottomAnchor, constant: 28),
            blueValueLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            redSlider.leadingAnchor.constraint(equalTo: redValueLabel.trailingAnchor, constant: 10),
            redSlider.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 48),
            redSlider.widthAnchor.constraint(greaterThanOrEqualToConstant: 160),
            
            greenSlider.leadingAnchor.constraint(equalTo: greenValueLabel.trailingAnchor, constant: 10),
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 18),
            greenSlider.widthAnchor.constraint(greaterThanOrEqualToConstant: 160),
            
            blueSlider.leadingAnchor.constraint(equalTo: blueValueLabel.trailingAnchor, constant: 10),
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 18),
            blueSlider.widthAnchor.constraint(greaterThanOrEqualToConstant: 160),
            
            redTextField.leadingAnchor.constraint(equalTo: redSlider.trailingAnchor, constant: 16),
            redTextField.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 49),
            redTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            redTextField.widthAnchor.constraint(equalToConstant: 50),
            
            greenTextField.leadingAnchor.constraint(equalTo: greenSlider.trailingAnchor, constant: 16),
            greenTextField.topAnchor.constraint(equalTo: redTextField.bottomAnchor, constant: 13),
            greenTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            greenTextField.widthAnchor.constraint(equalToConstant: 50),
            
            blueTextField.leadingAnchor.constraint(equalTo: blueSlider.trailingAnchor, constant: 16),
            blueTextField.topAnchor.constraint(equalTo: greenTextField.bottomAnchor, constant: 14),
            blueTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            blueTextField.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateContent() {
        rectangleView.backgroundColor = .init(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1)
        
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
}
