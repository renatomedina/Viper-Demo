//
//  ZapClient.swift
//  ZapChallenge
//
//  Created by Rodrigo Borges on 1/25/19.
//  Copyright © 2019 Rodrigo Borges. All rights reserved.
//

import Foundation

public protocol APIClientType: HTTPClientType {

    func fetchProperties(completion: @escaping ([Property]) -> ())
}

public final class APIClient: APIClientType {

    public var baseURL: URL {

        return URL(string: "http://grupozap-code-challenge.s3-website-us-east-1.amazonaws.com/sources/source-1.json")!
    }

    public var httpHeaders: [HTTPHeaderField : String] {

        return [HTTPHeaderField.contentType : ContentType.json.rawValue]
    }

    public let networkClient: NetworkClientType

    public init(networkClient: NetworkClientType) {

        self.networkClient = networkClient
    }

    public func fetchProperties(completion: @escaping ([Property]) -> ()) {

        self.networkClient.get(url: self.baseURL, headers: self.httpHeaders) { response in

            DispatchQueue.main.async {

                switch response {

                case .result(let data):
                    completion(self.decodeData(data))
                case .error:
                    completion([])
                }
            }
        }
    }

    private func decodeData(_ data: Data) -> [Property] {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode([Property].self, from: data)
            return response
        } catch {

            return []
        }
    }
}
