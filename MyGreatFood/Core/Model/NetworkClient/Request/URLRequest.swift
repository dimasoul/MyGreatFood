//
//  URLRequest.swift
//  MyGreatFood
//
//  Created by Дмитрий on 16.12.2022.
//

import Foundation

extension URLRequest {
    init?(request: Request) {
        guard let url = URL(string: "\(request.baseURL)\(request.path)") else { return nil }
        self.init(url: url)
    }
}
