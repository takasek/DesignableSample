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
    @IBOutlet private weak var additionalInfoLabel: UILabel!

    private var events: [String] = [] {
        didSet {
            additionalInfoLabel?.text = events.joined(separator: "\n")
        }
    }

    @IBInspectable var title: String {
        get {
            return titleLabel.text!
        }
        set {
            events.append("set(\(newValue.prefix(2)))")
            titleLabel.text = newValue
        }
    }

    // 呼ばれるタイミング:
    // - Storyboard, Xibでデザインされていた場合 かつ アプリ実行時
    required init?(coder aDecoder: NSCoder) {
        events.append("coder start")
        super.init(coder: aDecoder)
        setupView()
        events.append("coder end")
    }

    // 呼ばれるタイミング:
    // - コードでデザインされていた場合
    // - Storyboard, Xibでデザインされていた場合 かつ Xcode上で開く
    override init(frame: CGRect) {
        events.append("frame start")
        super.init(frame: frame)
        setupView()
        events.append("frame end")
    }

    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        events.append("awakeAfter")
        return super.awakeAfter(using: aDecoder)
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        events.append("prepareForIB")
    }

    private func setupView() {
        let nib = UINib(nibName: "HogeView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.snap(to: self)
    }
}
