public import HTTP_Cookies

extension HTTP.Session {
    /// Engine-free decisions for restoring and committing a session.
    public struct Policy: Sendable, Equatable {
        public let configuration: Configuration

        public init(configuration: Configuration = .init()) {
            self.configuration = configuration
        }

        public func lookup(cookie: HTTPCookies.Cookie?) -> Lookup {
            guard let cookie, cookie.name == configuration.cookieName else { return .new }
            return .existing(.init(string: cookie.value.string))
        }

        public func commit(_ session: HTTP.Session, incoming: ID? = nil) -> Commit {
            guard session.isValid else {
                guard let id = session.id ?? incoming else { return .none }
                return .destroy(id)
            }

            guard let id = session.id else { return .create(session.data) }
            switch configuration.rotation {
            case .never: return .update(id, session.data)
            case .onRestore: return .rotate(id, session.data)
            }
        }

        public func cookie(for id: ID) -> HTTPCookies.SetCookie {
            .init(
                name: configuration.cookieName,
                value: .init(string: id.string),
                configuration: configuration.cookie
            )
        }

        public func expiredCookie() -> HTTPCookies.SetCookie {
            var configuration = self.configuration.cookie
            configuration.maxAge = 0
            return .init(
                name: self.configuration.cookieName,
                value: .init(string: ""),
                configuration: configuration
            )
        }
    }
}
