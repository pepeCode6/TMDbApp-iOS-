//
//  Client.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation
import Alamofire

class Client {
    
    static let shared = Client()
    private let BASE_URL: String = "https://api.themoviedb.org/3/movie/"
    
    private init() { }
    
    func call<T: Decodable> (
        endPoint: String,
        method: HTTPMethod,
        // params: U?,
        success: @escaping (_ data: T) -> Void,
        failure: @escaping (_ err: String) -> Void
    ){
        print("do the request...")
        // print("params: \(String(describing: params))")
        
        AF.request( BASE_URL+endPoint, method: method ).responseJSON{ data in
//            print(self.BASE_URL+endPoint)
//            print(data.result)
            switch data.result{
            case .success(_):
                let decoder = JSONDecoder()
                if let jsonData = data.data {
                    do{
                        let result = try decoder.decode(T.self, from: jsonData)
                        success(result)
                    }catch {
                        print(error)
                        failure("Error al decodificar el JSON")
                    }
                }
                
            case .failure(_):
                failure("Error al enviar la peticion")
                break
            }
        }
        
    }
    
    
}



