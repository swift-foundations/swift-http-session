extension HTTP.Session {
  /// Engine-free decisions for restoring and committing a session.
  public struct Policy: Sendable, Equatable {
    public let configuration: Configuration

    public init(configuration: Configuration = .init()) {
      self.configuration = configuration
    }
  }
}
