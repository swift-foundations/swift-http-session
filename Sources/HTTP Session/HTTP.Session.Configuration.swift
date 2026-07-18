public import HTTP_Cookies

extension HTTP.Session {
    /// Cookie and identity policy for a session.
    public struct Configuration: Sendable, Equatable {
        public var cookieName: String
        public var cookie: HTTPCookies.Configuration
        public var rotation: Rotation

        public init(
            cookieName: String = "session",
            cookie: HTTPCookies.Configuration = .init(
                maxAge: 60 * 60 * 24 * 7,
                path: "/",
                isSecure: false,
                isHTTPOnly: false,
                sameSitePolicy: .lax
            ),
            rotation: Rotation = .never
        ) {
            self.cookieName = cookieName
            self.cookie = cookie
            self.rotation = rotation
        }
    }
}
