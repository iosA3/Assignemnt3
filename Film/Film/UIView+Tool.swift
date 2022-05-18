//
//  UIView+Tool.swift
//  Bubble
//
//  Created by HHH on 2022/5/15.
//

import Foundation
import UIKit

extension UIView {
    func setViewAllCorner(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
