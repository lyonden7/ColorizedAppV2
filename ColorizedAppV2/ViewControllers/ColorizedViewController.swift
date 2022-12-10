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
    
    // MARK: - Lify Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
    }
    
    override func viewWillLayoutSubviews() {
        setupColorView()
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
    }
    
    private func setupColorView() {
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
