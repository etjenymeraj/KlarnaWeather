extension Optional {
    func orThrow(_ error: Error) throws -> Wrapped {
        guard let self = self else {
            throw error
        }
        
        return self
    }

    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self, predicate(value) else {
            return nil
        }

        return value
    }
}

extension KeyedDecodingContainerProtocol {
    func decode<T: Decodable>(forKey key: Key) throws -> T {
        try decode(T.self, forKey: key)
    }

    func decodeIfPresent<T: Decodable>(forKey key: Key) throws -> T? {
        try decodeIfPresent(T.self, forKey: key)
    }
}
