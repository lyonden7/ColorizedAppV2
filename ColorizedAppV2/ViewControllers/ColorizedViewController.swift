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
    
    // MARK: - Public Properties
    var color: UIColor!
    
    // MARK: - Private Properties
    private var ciColor: CIColor {
        CIColor(color: color)
    }
    private var red: CGFloat {
        ciColor.red
    }
    private var green: CGFloat {
        ciColor.green
    }
    private var blue: CGFloat {
        ciColor.blue
    }
    private var alpha: CGFloat {
        ciColor.alpha
    }
    
    // MARK: - Lify Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupColorView()
    }
    
    override func viewWillLayoutSubviews() {
        setColor()
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderAction() {
        redValueLabel.text = string(from: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = string(from: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = string(from: blueSlider)
    }
}

// MARK: - Private Methods
extension ColorizedViewController {
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func setupColorView() {
        colorView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
    
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
}



//
//Необходимо доработать приложение ColorizedApp.
//
//Добавьте еще один экран и сделайте его стартовым. Экран со слайдерами — это экран настроек, в котором можно настроить цвет для первого экрана.
//
//При переходе на экран настроек в ColorView нужно передать текущий цвет основного экрана.
//При закрытии экрана настроек передайте на основной экран приложения цвет выбранный в настройках, используя для этого делегирование.


//ОПЦИОНАЛЬНО

//Сделайте текстовые поля, в которых можно задавать значение цвета с цифровой экранной клавиатуры. Свяжите клавиатуру с тулбаром и разместите в нем кнопку Done. По нажтию на кнопку клавиатура должна скрываться. Так же сделайте возможность скрывать клавиатуру тапом по экрану.
//
//Для работы с текстовыми полями подпишите класс под протокол UITextFieldDelegate и реализуйте метод протокола textFieldDidEndEditing(_ textField: UITextField) для передачи вносимых текстовых значений в лейблы и слайдеры. Так же не забудьте инициализировать делегатов для текстовых полей: textField.delegate = self. Это необходимо сделать в методе viewDidLoad.
//
//Значения слайдеров должны передаваться одновременно в лейблы и текстовые поля. Значения, вносимые в текстовые поля должны передаваться одновременно в слайдеры и в лейблы.
