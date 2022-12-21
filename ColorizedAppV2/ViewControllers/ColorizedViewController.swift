//
//  ColorizedViewController.swift
//  ColorizedAppV2
//
//  Created by Денис Васильев on 10.12.2022.
//

import UIKit

class ColorizedViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView! {
        didSet {
            colorView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var color: UIColor!
    var delegate: ColorizedViewControllerDelegate!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addToolbar()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        setColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        setValue(for: redValueLabel)
        setValue(for: redTextField)
    }
    
    @IBAction func greenSliderAction() {
        setValue(for: greenValueLabel)
        setValue(for: greenTextField)
    }
    
    @IBAction func blueSliderAction() {
        setValue(for: blueValueLabel)
        setValue(for: blueTextField)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate.setNewValues(color: colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ColorizedViewController {
    ///Метод, собирающий все методы по первоначальной настройке ColorView, UISlider, UITextfield, UILabel
    private func setupViews() {
        setMinimumTrackTintColor()
        setSliderValue()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    private func setMinimumTrackTintColor() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setSliderValue() {
        let ciColor = CIColor(color: color ?? .white)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                label.text = string(from: redSlider)
            case greenValueLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                textField.text = string(from: redSlider)
            case greenTextField:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    /// Настройка colorView через взаимодействие со слайдерами
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func addToolbar() {
        let toolbar = UIToolbar()
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        let doneToolbarButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneToolbarButtonPressed)
        )
        
        toolbar.items = [flexibleSpace, doneToolbarButton]
        toolbar.sizeToFit()
        
        [redTextField, greenTextField, blueTextField].forEach { textField in
            textField?.inputAccessoryView = toolbar
        }
    }
    
    @objc private func doneToolbarButtonPressed() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension ColorizedViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return }
        
        switch textField {
        case redTextField:
            redSlider.setValue(floatValue, animated: true)
            setValue(for: redValueLabel)
            setValue(for: redTextField)
        case greenTextField:
            greenSlider.setValue(floatValue, animated: true)
            setValue(for: greenValueLabel)
            setValue(for: greenTextField)
        default:
            blueSlider.setValue(floatValue, animated: true)
            setValue(for: blueValueLabel)
            setValue(for: blueTextField)
        }
    }
}
