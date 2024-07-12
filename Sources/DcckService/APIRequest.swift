import Foundation

public struct APIRequest {
    public enum APIError: Error {
        case invalidFormData
        // tambahkan kasus error lain jika diperlukan
    }

    let url: URL
    let method: String
    let headers: [String: String]?
    let body: Data?

    public static func jsonRequest(url: URL, method: String, parameters: [String: Any]?) throws -> APIRequest {
        var headers = ["Content-Type": "application/json"]

        let body = try parameters.map { try JSONSerialization.data(withJSONObject: $0, options: []) }

        return APIRequest(url: url, method: method, headers: headers, body: body)
    }

    public static func formDataRequest(url: URL, method: String, formData: [String: Any]?, boundary: String) throws -> APIRequest {
        var headers = ["Content-Type": "multipart/form-data; boundary=\(boundary)"]

        let body = try createMultipartFormData(formData, boundary: boundary)
        
        return APIRequest(url: url, method: method, headers: headers, body: body)
    }


    private static func createMultipartFormData(_ formData: [String: Any]?, boundary: String) throws -> Data {
        guard let formData = formData else {
            throw APIError.invalidFormData
        }

        var body = Data()

        for (key, value) in formData {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(value)\r\n".data(using: .utf8)!)
        }

        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        return body
    }

}


