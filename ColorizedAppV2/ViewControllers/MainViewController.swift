//
//  MainViewController.swift
//  ColorizedAppV2
//
//  Created by Денис Васильев on 11.12.2022.
//

import UIKit

protocol ColorizedViewControllerDelegate {
    func setNewValues(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainViewController: UIViewController {
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorizedVC = segue.destination as? ColorizedViewController else { return }
        
        let color = view.backgroundColor
        guard let color = color else { return }
        colorizedVC.color = color
        
        colorizedVC.delegate = self
    }
    
}

// MARK: - ColorizedViewControllerDelegate
extension MainViewController: ColorizedViewControllerDelegate {
    func setNewValues(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
