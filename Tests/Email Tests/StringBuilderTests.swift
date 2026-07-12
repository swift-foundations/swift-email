//
//  StringBuilderTests.swift
//  swift-email
//
//  Covers the surviving Email surface after the 2026-07-12 parking (see
//  Parked/Email/README.md): the inlined StringBuilder that replaced the
//  retired coenttb/swift-builders dependency (newline-join semantics).
//

import Email
import Testing

@Suite
struct StringBuilderTests {

    @Test
    func `Lines join with newlines`() {
        @StringBuilder
        func text() -> String {
            "first"
            "second"
        }
        #expect(text() == "first\nsecond")
    }

    @Test
    func `Optional and conditional branches build`() {
        @StringBuilder
        func text(include: Bool) -> String {
            "always"
            if include {
                "sometimes"
            }
        }
        #expect(text(include: true) == "always\nsometimes")
        #expect(text(include: false) == "always\n")
    }

    @Test
    func `Arrays join with newlines`() {
        @StringBuilder
        func text() -> String {
            for word in ["a", "b", "c"] {
                word
            }
        }
        #expect(text() == "a\nb\nc")
    }
}
