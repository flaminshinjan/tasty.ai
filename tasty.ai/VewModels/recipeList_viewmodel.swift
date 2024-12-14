import Foundation
import Combine
import os

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let logger = Logger(subsystem: "com.yourapp.RecipeApp", category: "Network")

    func fetchRecipes() {
        let urlString = "https://tasty-co1.p.rapidapi.com/recipes/list?size=5"
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            logger.error("Invalid URL: \(urlString)")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("", forHTTPHeaderField: "X-Rapidapi-Key")
        request.setValue("tasty-co1.p.rapidapi.com", forHTTPHeaderField: "X-Rapidapi-Host")

        // Log the API request details
        logger.info("Initiating API request to \(urlString)")
        logger.info("Request Headers: \(request.allHTTPHeaderFields ?? [:])")

        self.isLoading = true

        URLSession.shared.dataTaskPublisher(for: request)
            .retry(2) // Retry the API call twice for transient errors
            .tryMap { response -> Data in
                guard let httpResponse = response.response as? HTTPURLResponse else {
                    self.logger.error("Invalid HTTP response")
                    throw URLError(.badServerResponse)
                }
                if httpResponse.statusCode != 200 {
                    self.logger.error("API call failed with status code: \(httpResponse.statusCode)")
                    throw URLError(.badServerResponse)
                }
                self.logger.info("API call successful with status code: \(httpResponse.statusCode)")
                return response.data
            }
            .decode(type: RecipeAPIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    // Custom error handling
                    if let urlError = error as? URLError {
                        switch urlError.code {
                        case .notConnectedToInternet:
                            self.errorMessage = "No internet connection. Please check your network and try again."
                        case .timedOut:
                            self.errorMessage = "The request timed out. Please try again."
                        default:
                            self.errorMessage = "An unexpected error occurred: \(urlError.localizedDescription)"
                        }
                    } else {
                        self.errorMessage = "Failed to fetch recipes: \(error.localizedDescription)"
                    }
                    self.logger.error("Error: \(self.errorMessage ?? "Unknown Error")")
                case .finished:
                    self.logger.info("Successfully completed API call.")
                }
            }, receiveValue: { response in
                self.recipes = response.data.results
                self.logger.info("Fetched \(response.data.results.count) recipes successfully.")
            })
            .store(in: &self.cancellables)
    }
}
