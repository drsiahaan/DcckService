// The Swift Programming Language
// https://docs.swift.org/swift-book

@_exported import Foundation

public struct DcckService {
    public static func jsonRequest(url: URL, method: String, parameters: [String: Any]?) throws -> APIRequest {
        return try APIRequest.jsonRequest(url: url, method: method, parameters: parameters)
    }

    public static func formDataRequest(url: URL, method: String, formData: [String: Any]?, boundary: String) throws -> APIRequest {
        return try APIRequest.formDataRequest(url: url, method: method, formData: formData, boundary: boundary)
    }

    public static func sendRequest(request: APIRequest, completion: @escaping (Result<Data, APIClient.APIError>) -> Void) {
        let apiClient = APIClient()
        apiClient.sendRequest(request: request, completion: completion)
    }
}

