//
//  NetworkService.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 20/01/25.
//

import Foundation
import Combine

// MARK: - NetworkService
final class NetworkService {
    // MARK: - LogsLevel
    enum LogsLevel {
        /// Very detailing logs
        case debug
        /// Logs which show just method, url and success code for request
        case short
        /// Logs disabled
        case none
    }
    
    // MARK: - Constant
    private enum Constant {
        static let authorizationKey = "Authorization"
        static let bearerPrefix = "Bearer "
        static let basicAuth = "Basic Auth "
    }

    // MARK: - Private Properies
    private let logsLevel: LogsLevel = .debug
    private let mainSession = URLSession(configuration: .default)
    private let refreshSemaphore = DispatchSemaphore(value: 2)
    private let tokenProvider: TokenProvider = TokenProvider(storage: SecureStorage())
    
    // TEMP USING IF RESPONSE IS A MOCKED JSON
    func getData(from jsonName: String) -> Data? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            print("Failed to locate data.json in bundle.")
            return nil
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            return nil
        }
    }
    
    func handleOutput<T: Decodable>(data: Data?) -> AnyPublisher<T, Error> {
        return Just(data == nil ? EmptyResponse().data! : data!)
            .decode(type: T.self, decoder: CodableService.defaultDecoder)
            .eraseToAnyPublisher()
    }
    //
    

    // MARK: - Public Methods
    func performRequest<T: Decodable>(session: URLSession? = nil,
                                      route: BaseRouter,
                                      isAthorizedRequired: Bool = false) -> AnyPublisher<T, Error> {
        let authorization = UserDefaults.standard.authorization

        guard !(isAthorizedRequired && authorization?.accessToken == nil) else {
            return Fail(error: APIError.unathorized).eraseToAnyPublisher()
        }

        return performRequest(session: session ?? mainSession, route: route, token: isAthorizedRequired ? authorization?.accessToken : nil)
    }

    // MARK: - Private Methods
    private func performRequest<T: Decodable>(session: URLSession, route: BaseRouter, token: String? = nil) -> AnyPublisher<T, Error> {
        do {
            var request = try route.asURLRequest()

            if let token = token {
                request.setValue(Constant.bearerPrefix + token, forHTTPHeaderField: Constant.authorizationKey)
            }
            
            logRequest(request: request)
            return session.dataTaskPublisher(for: request)
                .subscribe(on: DispatchQueue.global(qos: .utility))
                .mapError { $0 as Error }
                .flatMap { [self] in
                    handleOutput($0, for: route, session: session)
                }
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.default()).eraseToAnyPublisher()
        }
    }


    private func handleOutput<T: Decodable>(_ output: URLSession.DataTaskPublisher.Output,
                                            for route: BaseRouter,
                                            session: URLSession) -> AnyPublisher<T, Error> {
        logOutput(output: output)
        switch (output.response as? HTTPURLResponse)?.statusCode {
        case .some(200), .some(201):
            return Just(output.data.isEmpty ? EmptyResponse().data! : output.data)
                .decode(type: T.self, decoder: CodableService.defaultDecoder)
                .eraseToAnyPublisher()
        case .some(201), .some(204):
            return Just(EmptyResponse().data!)
                .decode(type: T.self, decoder: CodableService.defaultDecoder)
                .eraseToAnyPublisher()
        default:
            return Just(output.data)
                .decode(type: ErrorResponse.self, decoder: CodableService.snakeDecoder)
                .flatMap { Fail(error: $0.apiError) }
                .eraseToAnyPublisher()
        }
    }
}

// MARK: - NetworkLogger
extension NetworkService {
    private func logRequest(request: URLRequest) {
        guard logsLevel != .none else {
            return
        }

        var log = "\(request.httpMethod!) \(request.url!)\n"

        if logsLevel == .debug,
           !(request.allHTTPHeaderFields?.isEmpty ?? true) {
            log += "Headers: [\n"
            request.allHTTPHeaderFields?.forEach({ log += "\($0.key): \($0.value)\n" })
            log += "]\n"
        }

        if logsLevel == .debug && !(request.url?.absoluteString.contains("/upload/") ?? true),
           let body = request.httpBody {
            let json = body.prettyPrintedJSONString
            log += "Body:\n\(json ?? String(decoding: body, as: UTF8.self))\n"
        }

        Log.networkRequest(log)
    }

    private func logOutput(output: URLSession.DataTaskPublisher.Output) {
        guard logsLevel != .none,
              let response = output.response as? HTTPURLResponse else {
            return
        }

        var log = "\(response.statusCode) \(response.url!)\n"

        if logsLevel == .debug {
            let json = output.data.prettyPrintedJSONString
            log += "Response:\n\(json ?? String(decoding: output.data, as: UTF8.self))\n"
        }

        Log.networkResponce(log)
    }
}

fileprivate extension Log {
    static func networkRequest(_ message: String) {
        Log.aprint(message, emoji: "⬆️")
    }

    static func networkResponce(_ message: String) {
        Log.aprint(message, emoji: "⬇️")
    }
}

fileprivate extension Data {
    var prettyPrintedJSONString: String? {

        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }

        return prettyPrintedString
    }
}
