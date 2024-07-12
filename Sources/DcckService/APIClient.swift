import Foundation

public class APIClient {
    public enum APIError: Error {
        case invalidURL
        case requestFailed(Error)
    }

    public init() {}

    public func sendRequest(request: APIRequest, completion: @escaping (Result<Data, APIError>) -> Void) {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidURL))
                return
            }

            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(.requestFailed(APIError.invalidURL)))
            }
        }

        task.resume()
    }
}

