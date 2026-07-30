extension HTTP.Session {
  /// An opaque identifier used to associate a client with stored session data.
  public struct ID: Sendable, Equatable, Hashable {
    public let string: String

    public init(string: String) {
      self.string = string
    }
  }
}
