//
//  ColorsViewController.swift
//  Change colors view
//
//  Created by Tatiana Sosina on 20.03.2022.
//

import UIKit

final class ColorsViewController: UIViewController {
    
    // MARK: - Private property

    private let showButton = UIButton()
    private let slidersChangeColorsViewController = SlidersChangeColorsViewController()
    
    // MARK: - Internal func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDefaultSettings()
    }
    
    // MARK: - Private func
    
    @objc private func switchButtonAction() {
        navigationController?.pushViewController(slidersChangeColorsViewController, animated: true)
    }
    
    private func setupDefaultSettings() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self,
                                                            action: #selector(switchButtonAction))
        
        slidersChangeColorsViewController.slidersAction = { [weak self] result in
            guard let self = self else { return }
            self.view.backgroundColor = result
        }
    }
}


