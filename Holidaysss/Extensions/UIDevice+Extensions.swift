//
//  UIDevice+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 20-09-23.
//

import UIKit

extension UIDevice {
    static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
