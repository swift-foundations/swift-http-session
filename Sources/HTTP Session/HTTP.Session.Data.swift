extension HTTP.Session {
    /// Key/value data associated with a session.
    public struct Data: Sendable, Equatable {
        public var snapshot: [String: String] { storage }

        private var storage: [String: String]

        public init() {
            storage = [:]
        }

        public init(initialData: [String: String]) {
            storage = initialData
        }

        public subscript(_ key: String) -> String? {
            get { storage[key] }
            set { storage[key] = newValue }
        }
    }
}

extension HTTP.Session.Data: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, String)...) {
        self.init(initialData: .init(elements, uniquingKeysWith: { $1 }))
    }
}
