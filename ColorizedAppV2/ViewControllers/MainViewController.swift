//
//  MainViewController.swift
//  ColorizedAppV2
//
//  Created by Денис Васильев on 11.12.2022.
//

import UIKit

protocol ColorizedViewControllerDelegate {
    func setNewValues(color: UIColor)
}

class MainViewController: UIViewController {
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorizedVC = segue.destination as? ColorizedViewController else { return }
        colorizedVC.color = view.backgroundColor
        colorizedVC.delegate = self
    }
}

// MARK: - ColorizedViewControllerDelegate
extension MainViewController: ColorizedViewControllerDelegate {
    func setNewValues(color: UIColor) {
        view.backgroundColor = color
    }
}
