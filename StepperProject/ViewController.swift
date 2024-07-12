//
//  ViewController.swift
//  StepperProject
//
//  Created by Omer Keskin on 12.07.2024.
//

class CustomStepper: UIStepper {
    
    private let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDivider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDivider()
    }
    
    private func setupDivider() {
        divider.backgroundColor = .blue
        addSubview(divider)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let dividerWidth: CGFloat = 2.0
        let dividerHeight = bounds.height
        let dividerX = bounds.width / 2 - dividerWidth / 2
        let dividerY: CGFloat = 0
        
        divider.frame = CGRect(x: dividerX, y: dividerY, width: dividerWidth, height: dividerHeight)
    }
}

import UIKit

class ViewController: UIViewController {
    
    let valueLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let stepper = CustomStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.stepValue = 5
        stepper.backgroundColor = .systemPink
        stepper.tintColor = .clear

        if let minusImage = UIImage(named: "doll1")?.withRenderingMode(.alwaysOriginal),
           let plusImage = UIImage(named: "doll2")?.withRenderingMode(.alwaysOriginal) {
            stepper.setDecrementImage(minusImage, for: .normal)
            stepper.setIncrementImage(plusImage, for: .normal)
        }
        
        
        valueLabel.text = "Value: \(Int(stepper.value))"
        valueLabel.textAlignment = .center
        view.addSubview(valueLabel)
  
        view.addSubview(stepper)
        
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: stepper.topAnchor, constant: -10)
        ])
 
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)

    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = "Value: \(Int(sender.value))"
    }
}




