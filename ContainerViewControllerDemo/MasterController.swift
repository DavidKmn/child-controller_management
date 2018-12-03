//
//  ViewController.swift
//  ContainerViewControllerDemo
//
//  Created by David on 12/01/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class MasterController: UIViewController {
    
    private lazy var segementedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "First", at: 0, animated: false)
        sc.insertSegment(withTitle: "Second", at: 1, animated: false)
        sc.selectedSegmentIndex = 0
        sc.layer.borderColor = UIColor.lightGray.cgColor
        sc.layer.borderWidth = 1
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        return sc
    }()
    
    lazy var firstController: FirstController = {
        let fc = FirstController()
        self.addSpecifiedViewControllerAsChildViewController(childViewController: fc)
        return fc
    }()
    
    lazy var secondController: SecondController = {
        let sc = SecondController()
        self.addSpecifiedViewControllerAsChildViewController(childViewController: sc)
        return sc
    }()
    
    @objc private func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupSubviews()
        
    
    }
    
    fileprivate func updateView() {
        firstController.view.isHidden = !(segementedControl.selectedSegmentIndex == 0)
        secondController.view.isHidden = (segementedControl.selectedSegmentIndex == 0)
    }
    
    fileprivate func setupSubviews() {
        
        view.addSubview(segementedControl)
        
        NSLayoutConstraint.activate([
            
            segementedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segementedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segementedControl.heightAnchor.constraint(equalToConstant: 30)
            
            ])
    }
    
    private func addSpecifiedViewControllerAsChildViewController(childViewController: UIViewController) {
        
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        childViewController.didMove(toParentViewController: self)
        
    }

}

