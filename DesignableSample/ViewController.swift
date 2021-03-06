//
//  ViewController.swift
//  DesignableSample
//
//  Created by Yoshitaka Seki on 2018/10/16.
//  Copyright © 2018年 takasek. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let hogeView = HogeView()
        hogeView.title = "コードで作った"
        stackView.addArrangedSubview(hogeView)
    }
}

