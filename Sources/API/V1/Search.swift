//
//  File.swift
//  
//
//  Created by Tomoya Hirano on 2021/05/14.
//

import Foundation
import Object

extension V1.Search {
    /// Search
    ///
    /// https://developers.notion.com/reference/post-search
    public struct Search: Request {
        
        // TODO: Support Filter, Sort,
        public init(query: String, pagination: PaginationParameter = .default) {
            struct Parameter: Encodable {
                let query: String
                let startCursor: String?
                let pageSize: Int32?
            }
            let parameter = Parameter(
                query: query,
                startCursor: pagination.startCursor,
                pageSize: pagination.pageSize
            )
            httpBody = ParameterEncoder().encode(parameter)
        }
        
        public var path: String { "/v1/search" }
        public let method: HTTPMethod = .post
        public let httpBody: Data?
        public typealias Response = Object.List<Object.SearchResult>
    }
}


