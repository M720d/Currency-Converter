//
//  File.swift
//  Currency Converter
//
//  Created by Dev Salvi on 21/12/22.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdatePrice(price: String)
    func didFailWithError(error: Error)
}

struct CurrencyManager {
    
    var delegate : CurrencyManagerDelegate?
//    let value = CurrencyData()
    
    let baseURL = " "
    let apiKey = " "
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCurrencyPrice(){
        var semaphore = DispatchSemaphore (value: 0)
        
        let url = "https://api.apilayer.com/exchangerates_data/convert?to=INR&from=USD&amount=2"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("b7OpcbdQ8i3Lic5GaXDlmyxXYSaOuNhx", forHTTPHeaderField: "apikey")
        print(request)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
//                print(String(describing: error))
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(CurrencyData.self, from: data)
                DispatchQueue.main.async {
                    print(jsonResult.result)
                }
            }catch{
                print(error)
            }
            
//            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
    
//        func parseJSON(_ data: Data) -> Double? {
//
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(CurrencyData.self, from: data)
//                let lastPrice = decodedData.result
//                print("jdfkh")
//                print(lastPrice)
//                return lastPrice
//
//            } catch {
//                delegate?.didFailWithError(error: error)
//                return nil
//            }
//        }
    
}


