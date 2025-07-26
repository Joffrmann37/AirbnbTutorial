import Foundation
import Combine

/// Use case for fetching listings from a fetchable repository.
final class FetchListingsUseCase {
    // MARK: - Dependencies
    private let repository: Fetchable
    
    // MARK: - Initialization
    /// Initializes the use case with the provided repository.
    /// - Parameter repository: A repository conforming to `Fetchable`.
    init(repository: Fetchable) {
        self.repository = repository
    }
    
    // MARK: - Public API
    /// Executes a network request and decodes the response into the specified type.
    /// - Parameters:
    ///   - request: The URL request to execute.
    ///   - type: The `Decodable` type to decode the response into.
    /// - Returns: A `Future` that emits the decoded model or an `ABError`.
    @discardableResult
    func execute<T: Decodable>(
        request: URLRequest,
        as type: T.Type
    ) -> Future<T, ABError> {
        return repository.fetch(request: request, forType: type)
    }
}
