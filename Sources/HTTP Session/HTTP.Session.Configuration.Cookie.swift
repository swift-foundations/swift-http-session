public import HTTP_Cookies

extension HTTP.Session.Configuration {
  /// The session cookie name and response attributes.
  public struct Cookie: Sendable, Equatable {
    public var name: String
    public var attributes: HTTPCookies.Configuration

    public init(
      name: String = "session",
      attributes: HTTPCookies.Configuration = .init(
        maxAge: 60 * 60 * 24 * 7,
        path: "/",
        isSecure: false,
        isHTTPOnly: false,
        sameSitePolicy: .lax
      )
    ) {
      self.name = name
      self.attributes = attributes
    }
  }
}
