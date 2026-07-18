import HTTP_Cookies
import HTTP_Session
import Testing

extension HTTP.Session.Policy {
    @Suite
    struct Test {
        @Test
        func `missing cookie starts a new session`() {
            let policy = Self.policy

            #expect(policy.lookup(cookie: nil) == .new)
        }

        @Test
        func `matching cookie requests restoration`() {
            let policy = Self.policy
            let cookie = HTTPCookies.Cookie(
                name: "session",
                value: .init(string: "abc")
            )

            #expect(policy.lookup(cookie: cookie) == .existing(.init(string: "abc")))
        }

        @Test
        func `active session without identity creates`() {
            let policy = Self.policy
            let session = HTTP.Session(data: ["name": "Swift"])

            #expect(policy.commit(session) == .create(session.data))
        }

        @Test
        func `restored active session updates`() {
            let policy = Self.policy
            let session = HTTP.Session(id: .init(string: "abc"), data: ["name": "Swift"])

            #expect(policy.commit(session) == .update(.init(string: "abc"), session.data))
        }

        @Test
        func `destroyed session deletes and expires`() {
            let policy = Self.policy
            var session = HTTP.Session(id: .init(string: "abc"))
            session.destroy()

            #expect(policy.commit(session) == .destroy(.init(string: "abc")))
            #expect(policy.cookie(expiry: .expired).configuration.maxAge == 0)
        }

        @Test
        func `rotation replaces restored identity`() {
            let policy = HTTP.Session.Policy(
                configuration: .init(rotation: .onRestore)
            )
            let session = HTTP.Session(id: .init(string: "abc"))

            #expect(policy.commit(session) == .rotate(.init(string: "abc"), session.data))
        }

        private static var policy: HTTP.Session.Policy {
            .init(configuration: .init(cookie: .init(name: "session")))
        }
    }
}
