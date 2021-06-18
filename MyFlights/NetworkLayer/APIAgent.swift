//
//  APIService.swift
//  MySpotify
//
//  Created by Marjan on 2/9/1400 AP.
//

import Foundation
import Combine

struct APIAgent {
    
    static func run<T: Codable>(_ endPoint: EndPoint) -> AnyPublisher<Response<T>, Error> {
                
        let request = URLRequest(endpoint: endPoint)
                
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                return APIAgent.processDataResponse(result)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func processDataResponse<T: Codable>(_ output: URLSession.DataTaskPublisher.Output) -> Response<T>{
        
        guard let httpResponse = output.response as? HTTPURLResponse else {
            return Response(value: nil, error: .unknown)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            
            do{
                let model = try JSONDecoder().decode(T.self, from: output.data)
                return Response(value: model, error: nil)
            }catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            return Response(value: nil, error: .decodingError)
        default:
            return Response(value: nil, error: .httpError(httpResponse.statusCode))
        }
        
    }
    
}
