extension HTTP.Session {
  /// Key/value data associated with a session.
  public struct Data: Sendable, Equatable {
    var storage: [String: String]

    public init() {
      storage = [:]
    }

    public init(initialData: [String: String]) {
      storage = initialData
    }

  }
}

extension HTTP.Session.Data: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (String, String)...) {
    self.init(initialData: .init(elements, uniquingKeysWith: { $1 }))
  }
}
