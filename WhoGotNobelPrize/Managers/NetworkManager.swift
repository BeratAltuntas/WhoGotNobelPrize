//
//  NetworkManager.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 31.05.2022.
//

import Foundation

struct ApiError: Error {
	let desc: String?
}

final class NetworkManager {
	static let shared = NetworkManager()
	typealias CompletionModel<T> = (Result<T, ApiError>)-> Void where T: Decodable
	typealias CompletionData = (_ success: Bool, _ response: String) -> Void
	
	func FetchData(endPoint: String, completion: @escaping CompletionData) {
		guard let url = URL(string: endPoint) else { return }
		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
			if let error = error {
				print(error)
				return
			}
			guard let httpResponse = response as? HTTPURLResponse,
				  (200...299).contains(httpResponse.statusCode) else {
				return
			}
			do {
				if let data = data {
					completion(true, String(data: data, encoding: .utf8)!)
				}
			}
			catch{
				print("JSON decode failed: \(error)")
			}
		})
		task.resume()
	}
	
	func FetchData<T: Decodable>(endPoint: String, type: T?.Type, completion: @escaping CompletionModel<T> ) {
	 guard let url = URL(string: endPoint) else { return }
	 let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
		 if let error = error {
			 print(error)
			 return
		 }
		 guard let httpResponse = response as? HTTPURLResponse,
			   (200...299).contains(httpResponse.statusCode) else {
			 return
		 }
		 do {
			 if let data = data, let tSummary = try JSONDecoder().decode(type, from: data) {
				 completion(.success(tSummary))
			 }
		 }
		 catch{
			 print("JSON decode failed: \(error)")
		 }
	 })
	 task.resume()
 }

}
