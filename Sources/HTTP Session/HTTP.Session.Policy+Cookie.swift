public import HTTP_Cookies

extension HTTP.Session.Policy {
  public func cookie(for id: HTTP.Session.ID) -> HTTPCookies.SetCookie {
    .init(
      name: configuration.cookie.name,
      value: .init(string: id.string),
      configuration: configuration.cookie.attributes
    )
  }

  public func cookie(expiry: Expiry) -> HTTPCookies.SetCookie {
    guard expiry == .expired else { return cookie(for: .init(string: "")) }
    var attributes = configuration.cookie.attributes
    attributes.maxAge = 0
    return .init(
      name: configuration.cookie.name,
      value: .init(string: ""),
      configuration: attributes
    )
  }
}
