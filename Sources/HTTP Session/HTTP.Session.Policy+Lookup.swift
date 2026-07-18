public import HTTP_Cookies

extension HTTP.Session.Policy {
    public func lookup(cookie: HTTPCookies.Cookie?) -> Lookup {
        guard let cookie, cookie.name == configuration.cookie.name else { return .new }
        return .existing(.init(string: cookie.value.string))
    }
}
