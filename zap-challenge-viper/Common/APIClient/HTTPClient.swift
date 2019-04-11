//
//  HTTPClient.swift
//  ZapChallenge
//
//  Created by Rodrigo Borges on 1/25/19.
//  Copyright © 2019 Rodrigo Borges. All rights reserved.
//

import Foundation

public protocol HTTPClientType: AnyObject {

    var baseURL: URL { get }
    var httpHeaders: [HTTPHeaderField : String] { get }
    var networkClient: NetworkClientType { get }
}
