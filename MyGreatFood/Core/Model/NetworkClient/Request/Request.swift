//
//  Request.swift
//  MyGreatFood
//
//  Created by Дмитрий on 16.12.2022.
//

import Foundation

protocol Request {
    var baseURL: String { get }
    var path: String { get }
}
