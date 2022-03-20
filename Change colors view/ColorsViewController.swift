//
//  ColorsViewController.swift
//  Change colors view
//
//  Created by Tatiana Sosina on 20.03.2022.
//

import UIKit

class ColorsViewController: UIViewController {

    let switchButton = UIButton()
    let slidersChangeColorsViewController = SlidersChangeColorsViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDefaultSettings()
    }
    
    @objc func switchButtonAction() {
        navigationController?.pushViewController(slidersChangeColorsViewController, animated: true)

    }
    
    private func setupDefaultSettings() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self,
                                                            action: #selector(switchButtonAction))
    }


}

