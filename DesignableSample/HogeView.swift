//
//  HogeView.swift
//  DesignableSample
//
//  Created by Yoshitaka Seki on 2018/10/16.
//  Copyright © 2018年 takasek. All rights reserved.
//

import UIKit

extension UIView {
    public func snap(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

@IBDesignable final class HogeView: UIView {

    @IBOutlet private weak var titleLabel: UILabel!

    @IBInspectable var title: String {
        get { return titleLabel.text! }
        set { titleLabel.text = newValue }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError() // あれっ、Storyboardでcrashしない!!??
        setupView()
        titleLabel.text = "coderからinit"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        titleLabel.text = "frameからinit" // 👈Storyboardで反映されるのこっち!!!???
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
//        titleLabel.text = titleLabel.text! + titleLabel.text!
    }

    private func setupView() {
        let nib = UINib(nibName: "HogeView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.snap(to: self)
    }
}
