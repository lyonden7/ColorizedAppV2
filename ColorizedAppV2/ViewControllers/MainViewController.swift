//
//  MainViewController.swift
//  ColorizedAppV2
//
//  Created by Денис Васильев on 11.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    // MARK: - Public Properties
    
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorizedVC = segue.destination as? ColorizedViewController else { return }
        
        let color = view.backgroundColor
        guard let color = color else { return }
        colorizedVC.color = color
        
    }
    
    
    // MARK: - IB Actions
    

}