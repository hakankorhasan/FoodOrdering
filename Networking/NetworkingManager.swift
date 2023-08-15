//
//  NetworkingManager.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 15.08.2023.
//

import UIKit

struct NetworkingManager {
    
    func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let param = parameters {
            switch method {
            case .get:
                /*
                 var urlComponent = URLComponents(string: urlString)
                 İlk adımda, URLComponents nesnesi oluşturulur ve bu nesne URL dizgesini temel alır. Bu nesne, URL'nin farklı bileşenlerine erişim sağlar.
                 urlComponent?.queryItems = param.map({ ... })
                 Parametreler dizisini kullanarak URL sorgu parametrelerini URLQueryItem nesneleri olarak oluşturur. Bu, sorgu parametrelerini URL'nin sonuna eklemeye hazırlık yapar.
                 urlRequest.url = urlComponent?.url
                 Oluşturulan sorgu parametreleri, URL'nin sonuna eklenerek tamamlanan URL urlRequest.url özelliğine atanır. Böylece istek, istenen verileri almak için bu URL'yi kullanır.
                 */
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = param.map({
                    URLQueryItem(name: $0, value: "\($1)")
                })
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                /*
                 let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                 Parametreler dizisinin JSON formatına dönüştürülmesi işlemi burada gerçekleşir. JSONSerialization kullanılarak parametreler JSON veri biçimine dönüştürülür.
                 urlRequest.httpBody = bodyData
                 Oluşturulan JSON verisi, isteğin gövde kısmına (httpBody) eklenir. Bu, isteğin "POST", "DELETE" veya "PATCH" işlemleri için gerekli olan verileri içerir.
                 */
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        /*
         Sonuç olarak, kod örneği belirli bir Route ve Method kullanarak farklı türde HTTP istekleri oluşturur. "GET" isteği sorgu parametrelerini URL'ye eklerken, "POST", "DELETE" ve "PATCH" istekleri gövde kısmına JSON verilerini ekler. Bu şekilde, istenilen türde istekler oluşturmak için genel bir yapı sağlanmış olur.
         */
        return urlRequest
    }
}
