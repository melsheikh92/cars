//
//  DefaultingJSONDecoder.swift
//  Cars
//
//  Created by Msheikh on 11/29/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//


import Foundation
import RealmSwift

public protocol CodingKeyWithDefaults: CodingKey {
    func defaultValue<T>(_ type: T.Type) throws -> T?
}

public protocol DecodableWithDefault: Decodable {
    init()
}

public protocol KeyedDecodedProcessing {
    func postDecode<K>(container:K, forKey: K.Key) throws where K: KeyedDecodingContainerProtocol
}

extension CodingKeyWithDefaults {
    // swiftlint:disable:next cyclomatic_complexity
    public func defaultZeroValuesForNumberTypes<T>(_ type: T.Type) -> T? {
        switch T.self {
        case is Bool.Type:
            return (Bool(false) as! T)
        case is Int.Type:
            return (Int(0) as! T) // swiftlint:disable:this force_cast
        case is Int8.Type:
            return (Int8(0) as! T) // swiftlint:disable:this force_cast
        case is Int16.Type:
            return (Int16(0) as! T) // swiftlint:disable:this force_cast
        case is Int32.Type:
            return (Int32(0) as! T) // swiftlint:disable:this force_cast
        case is Int64.Type:
            return (Int64(0) as! T) // swiftlint:disable:this force_cast
        case is UInt.Type:
            return (UInt(0) as! T) // swiftlint:disable:this force_cast
        case is UInt8.Type:
            return (UInt8(0) as! T) // swiftlint:disable:this force_cast
        case is UInt16.Type:
            return (UInt16(0) as! T) // swiftlint:disable:this force_cast
        case is UInt32.Type:
            return (UInt32(0) as! T) // swiftlint:disable:this force_cast
        case is UInt64.Type:
            return (UInt64(0) as! T) // swiftlint:disable:this force_cast
        case is Float.Type:
            return (Float(0) as! T) // swiftlint:disable:this force_cast
        case is Double.Type:
            return (Double(0) as! T) // swiftlint:disable:this force_cast
        default:
            return nil
        }
    }
    
    public func defaultValue<T>(_ type: T.Type) throws -> T? {
        if let v = self.defaultZeroValuesForNumberTypes(type) {
            return v
        }
        return nil
    }
    
    public func defaultValue<T>(container: KeyedDecodingContainer<Self>, _ type: T.Type) throws -> T {
        if let t = try self.defaultValue(type) {
            return t
        }
        let debugDescription = "no default value found for \(self) in \(Self.self)"
        let context = DecodingError.Context(codingPath: container.codingPath,
                                            debugDescription: debugDescription)
        throw DecodingError.typeMismatch(Self.self, context)
    }
    
}

protocol DefaultDecoderTarget {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}
extension JSONDecoder: DefaultDecoderTarget {}

extension DefaultDecoderTarget {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: DecodableWithDefault {
        let decoderGrabber = try self.decode(DecoderGrabber.self, from: data)
        let defaultingDecoder = DefaultingDecoder(wrapping: decoderGrabber.decoder)
        return try T(from: defaultingDecoder)
    }
}

open class DefaultingJSONDecoder: JSONDecoder {
    override open func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        let decoderGrabber = try super.decode(DecoderGrabber.self, from: data)
        let defaultingDecoder = DefaultingDecoder(wrapping: decoderGrabber.decoder)
        return try T(from: defaultingDecoder)
    }
}

struct DecoderGrabber: Decodable {
    let decoder: Decoder
    
    public init(from decoder: Decoder) throws {
        self.decoder = decoder
    }
    
}

struct DefaultingDecoder: Decoder {
    // swiftlint:disable:next force_unwrapping
    static let enclosedTypeKey = CodingUserInfoKey(rawValue: "org.futurekit.DefaultingDecoder.enclosedType")!
    // swiftlint:disable:next force_unwrapping line_length
    static let enclosedTypeIsDefaultingKey = CodingUserInfoKey(rawValue: "org.futurekit.DefaultingDecoder.enclosedTypeIsDefaulting")!
    
    let innerDecoder: Decoder
    
    init(wrapping decoder: Decoder) {
        innerDecoder = decoder
    }
    
    var codingPath: [CodingKey] {
        return innerDecoder.codingPath
    }
    
    var userInfo: [CodingUserInfoKey: Any] {
        return innerDecoder.userInfo
    }
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
        let nestedContainer = try innerDecoder.container(keyedBy: type)
        let container = DefaultingKeyedDecodingContainer(container: nestedContainer)
        return KeyedDecodingContainer(container)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return DefaultUnkeyedDecodingContainer(container: try innerDecoder.unkeyedContainer())
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        return DefaultSingleValueDecodingContainer(container: try innerDecoder.singleValueContainer())
    }
    
}

public struct DefaultSingleValueDecodingContainer: SingleValueDecodingContainer {
    public var codingPath: [CodingKey] {
        return innerContainer.codingPath
    }
    
    private let innerContainer: SingleValueDecodingContainer
    
    public init(container: SingleValueDecodingContainer) {
        innerContainer = container
    }
    
    
    public func decodeNil() -> Bool {
        return innerContainer.decodeNil()
    }
    
    public func decode(_ type: Bool.Type) throws -> Bool {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Int.Type) throws -> Int {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Int8.Type) throws -> Int8 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Int16.Type) throws -> Int16 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Int32.Type) throws -> Int32 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Int64.Type) throws -> Int64 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: UInt.Type) throws -> UInt {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Float.Type) throws -> Float {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: Double.Type) throws -> Double {
        return try innerContainer.decode(type)
    }
    
    public func decode(_ type: String.Type) throws -> String {
        return try innerContainer.decode(type)
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
        if T.self is DecodableWithDefault.Type {
            if innerContainer.decodeNil() {
                let metaType = (T.self as! DecodableWithDefault.Type) // swiftlint:disable:this force_cast
                return (metaType.init() as! T) // swiftlint:disable:this force_cast
            }
        }
        return try innerContainer.decode(type)
    }
    
    public func decode<T>(_ type: T.Type) throws -> T where T: DecodableWithDefault {
        if innerContainer.decodeNil() {
            return T()
        }
        return try innerContainer.decode(type)
    }
}

public struct DefaultUnkeyedDecodingContainer: UnkeyedDecodingContainer {
    
    var innerContainer: UnkeyedDecodingContainer
    
    public init(container: UnkeyedDecodingContainer) {
        innerContainer = container
    }
    
    public var codingPath: [CodingKey] {
        return innerContainer.codingPath
    }
    
    public var count: Int? {
        return innerContainer.count
    }
    
    public var isAtEnd: Bool {
        return innerContainer.isAtEnd
    }
    
    public var currentIndex: Int {
        return innerContainer.currentIndex
    }
    
    public mutating func decodeNil() throws -> Bool {
        return try innerContainer.decodeNil()
    }
    
    public mutating func decode(_ type: Bool.Type) throws -> Bool {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Int.Type) throws -> Int {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Int8.Type) throws -> Int8 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Int16.Type) throws -> Int16 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Int32.Type) throws -> Int32 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Int64.Type) throws -> Int64 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: UInt.Type) throws -> UInt {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: UInt8.Type) throws -> UInt8 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: UInt16.Type) throws -> UInt16 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: UInt32.Type) throws -> UInt32 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: UInt64.Type) throws -> UInt64 {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Float.Type) throws -> Float {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: Double.Type) throws -> Double {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode(_ type: String.Type) throws -> String {
        return try innerContainer.decode(type)
    }
    
    public mutating func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
        if T.self is DecodableWithDefault.Type {
            if try innerContainer.decodeNil() {
                let metaType = (T.self as! DecodableWithDefault.Type) // swiftlint:disable:this force_cast
                return (metaType.init() as! T) // swiftlint:disable:this force_cast
            }
        }
        return try innerContainer.decode(type)
    }
    
    public mutating func decode<T>(_ type: T.Type) throws -> T where T: DecodableWithDefault {
        if try innerContainer.decodeNil() {
            return T()
        }
        return try innerContainer.decode(type)
    }
    
    
    public mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nestedContainer = try innerContainer.nestedContainer(keyedBy: type)
        let container = DefaultingKeyedDecodingContainer(container: nestedContainer)
        return KeyedDecodingContainer(container)
    }
    
    public mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        return DefaultUnkeyedDecodingContainer(container: try innerContainer.nestedUnkeyedContainer())
    }
    
    public mutating func superDecoder() throws -> Decoder {
        return DefaultingDecoder(wrapping: try innerContainer.superDecoder())
    }
    
    
}

public struct DefaultingKeyedDecodingContainer<K> : KeyedDecodingContainerProtocol where K: CodingKey {
    
    public typealias Key = K
    
    let innerContainer: KeyedDecodingContainer<K>
    
    public init(container: KeyedDecodingContainer<K>) {
        innerContainer = container
    }
    
    public init<C>(container: C) where C: KeyedDecodingContainerProtocol, C.Key == Key {
        innerContainer = KeyedDecodingContainer(container)
    }
    
    public var codingPath: [CodingKey] {
        return innerContainer.codingPath
    }
    
    public var allKeys: [K] {
        return innerContainer.allKeys
    }
    
    public func contains(_ key: K) -> Bool {
        return innerContainer.contains(key)
    }
    
    private func _decode<T>(_ type: T.Type, forKey key: K) throws -> T where T: Decodable {
        if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
            return t
        }
        if K.self is CodingKeyWithDefaults.Type {
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
        }
        if T.self is DecodableWithDefault.Type {
            let metaType = (T.self as! DecodableWithDefault.Type) // swiftlint:disable:this force_cast
            return (metaType.init() as! T) // swiftlint:disable:this force_cast
        }
        let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                   debugDescription: debugDescription))
    }
    
    public func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T: Decodable {
        let t = try _decode(type, forKey: key)
        if T.self is KeyedDecodedProcessing.Type {
            // swiftlint:disable:next force_cast
            try (t as! KeyedDecodedProcessing).postDecode(container: self, forKey: key)
        }
        return t
    }
    
    public func decode(_ type: String.Type, forKey key: K) throws -> String {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        if K.self is CodingKeyWithDefaults.Type {
            if let t = try innerContainer.decodeIfPresent(type, forKey: key) {
                return t
            }
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
            let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                       debugDescription: debugDescription))
        } else {
            return try innerContainer.decode(type, forKey: key)
        }
    }
    
    public func decodeNil(forKey key: K) throws -> Bool {
        return try innerContainer.decodeNil(forKey: key)
    }
    
    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        let nestedContainer = try innerContainer.nestedContainer(keyedBy: type, forKey: key)
        let container = DefaultingKeyedDecodingContainer<NestedKey>(container: nestedContainer)
        return KeyedDecodingContainer<NestedKey>(container)
    }
    
    public func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        return DefaultUnkeyedDecodingContainer(container: try innerContainer.nestedUnkeyedContainer(forKey: key))
    }
    
    public func superDecoder() throws -> Decoder {
        return DefaultingDecoder(wrapping: try innerContainer.superDecoder())
    }
    
    public func superDecoder(forKey key: K) throws -> Decoder {
        return DefaultingDecoder(wrapping: try innerContainer.superDecoder(forKey: key))
    }
    
    
}

extension KeyedDecodingContainerProtocol {
    
    public var missingKeys: [Key] {
        return self.allKeys.filter { !self.contains($0) }
    }
    
    public var containsKeys: [Key] {
        return self.allKeys.filter { self.contains($0) }
    }
    
    private func _defaultingDecode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: Decodable {
        if let t = try self.decodeIfPresent(type, forKey: key) {
            return t
        }
        if Key.self is CodingKeyWithDefaults.Type {
            // swiftlint:disable:next force_cast
            if let t = try (key as! CodingKeyWithDefaults).defaultValue(type) {
                return t
            }
        }
        if T.self is DecodableWithDefault.Type {
            let metaType = (T.self as! DecodableWithDefault.Type) // swiftlint:disable:this force_cast
            return (metaType.init() as! T) // swiftlint:disable:this force_cast
        }
        let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                   debugDescription: debugDescription))
    }
    public func defaultingDecode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: Decodable {
        let t = try _defaultingDecode(type, forKey: key)
        if T.self is KeyedDecodedProcessing.Type {
            // swiftlint:disable:next force_cast
            try (t as! KeyedDecodedProcessing).postDecode(container: self, forKey: key)
        }
        return t
    }
}

extension KeyedDecodingContainerProtocol where Key: CodingKeyWithDefaults {
    
    private func _defaultingDecode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: DecodableWithDefault {
        if let t = try self.decodeIfPresent(type, forKey: key) {
            return t
        }
        if let t = try key.defaultValue(type) {
            return t
        }
        return T()
    }
    
    private func _defaultingDecode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: Decodable {
        if let t = try self.decodeIfPresent(type, forKey: key) {
            return t
        }
        if let t = try key.defaultValue(type) {
            return t
        }
        if T.self is DecodableWithDefault.Type {
            let metaType = (T.self as! DecodableWithDefault.Type) // swiftlint:disable:this force_cast
            return (metaType.init() as! T) // swiftlint:disable:this force_cast
        }
        let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                   debugDescription: debugDescription))
    }
    
    
    public func decode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: DecodableWithDefault {
        if let t = try self.decodeIfPresent(type, forKey: key) {
            return t
        }
        if let t = try key.defaultValue(type) {
            return t
        }
        return T()
    }
    
    public func decode<T>(_ type: T.Type, forKey key: Self.Key) throws -> T where T: Decodable {
        if let t = try self.decodeIfPresent(type, forKey: key) {
            return t
        }
        if let t = try key.defaultValue(type) {
            return t
        }
        let debugDescription = "No value associated with key \(key) (\"\(key.stringValue)\")."
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: self.codingPath,
                                                                   debugDescription: debugDescription))
    }
    
}
