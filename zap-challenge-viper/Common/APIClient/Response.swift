//
//  Response.swift
//  ZapChallenge
//
//  Created by Rodrigo Borges on 1/25/19.
//  Copyright © 2019 Rodrigo Borges. All rights reserved.
//

import Foundation

public enum Response {

    case result(Data)
    case error(Error?)
}
