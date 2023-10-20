//
//  NSObject+Utils.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import Foundation

extension NSObject {
    public class var name: String {
        return String(describing: self)
    }
}
