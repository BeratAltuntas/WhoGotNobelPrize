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
	typealias Completion<T> = (Result<T, ApiError>)-> Void where T: Decodable

	func fetchData<T: Decodable>(endPoint: String, type: T?.Type, completion: @escaping Completion<T> ) {
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
