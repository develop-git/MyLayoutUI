//
//  TangramLayoutExtraEnums.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)

import TangramKit

public enum DynamicLayoutType {
    case fill, wrap
}

public enum LayoutRelation {
    case equal, min, max, range
}

public enum CombinedLiteral : ExpressibleByNilLiteral, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public init(floatLiteral value: Float) {
        self = CombinedLiteral.equal(CGFloat(value))
    }
   
    public init(integerLiteral value: Int) {
        self = CombinedLiteral.equal(CGFloat(value))
    }
    
    public init(nilLiteral: ()) {
        self = CombinedLiteral.equal(CGFloat(0))
    }
    
    public init(value: CGFloat) {
        self = CombinedLiteral.equal(value)
    }
    
    /**
        在相对布局中使用最大、最小布局条件时，需要指定明确的边界Anchor（top\bottom.....）
     */
    case `default` /// default 10
    case zero
    case one
    case equal(_ value: CGFloat)
    
    case minGlobal
    case minZero
    case min(_ value: CGFloat)
    
    case maxGlobal
    case maxZero
    case max(_ value: CGFloat)
    
    /// Range
    case `in`(_ range: ClosedRange<CGFloat>)
    
    case comb(LayoutRelation, ClosedRange<CGFloat>)
    
    var raw: (range: ClosedRange<CGFloat>, relation: LayoutRelation) {
        let global: CGFloat = 10.0, zero: CGFloat = 0.0, one: CGFloat = 1.0
        switch self {
        /// Equal
        case .default:
            return (global.range, .equal)
        case .zero:
            return (zero.range, .equal)
        case .one:
            return (one.range, .equal)
        case .equal(let val):
            return (val.range, .equal)
            
        /// Min
        case .minGlobal:
            return (global.range, .min)
        case .minZero:
            return (zero.range, .min)
        case .min(let val):
            return (val.range, .min)
            
        /// Max
        case .maxGlobal:
            return (global.range, .max)
        case .maxZero:
            return (zero.range, .max)
        case .max(let val):
            return (val.range, .max)
            
        /// Range
        case .in(let range):
            return (range, .range)
            
        case .comb(let restrict, let val):
            return (val, restrict)
        }
    }
}

internal extension CGFloat {
    var range: ClosedRange<CGFloat> {
        return self...self
    }
}

// MARK: 自定义 enum 及 struct
public enum DeviceScreenType {
    
    var rawValue: TangramKit.TGSizeClassType {
        get {
            switch self {
            case .portrait:
                return .portrait
            case .landscape:
                return .landscape
            case .comb(let device, let screen):
                switch device {
                case .iPhone:
                    switch screen {
                    case .portrait:
                        return .comb(.any, .regular, nil)
                    case .landscape:
                        return .comb(.any, .compact, nil)
                    }
                case .iPad:
                    switch screen {
                    case .portrait:
                        return .comb(.regular, .regular, .portrait)
                    case .landscape:
                        return .comb(.regular, .regular, .landscape)
                    }
                }
            }
        }
    }
    
    public enum Device {
        case iPhone
        case iPad
    }
    public enum Screen {
        case portrait
        case landscape
    }
    case portrait
    case landscape
    case comb(Device, Screen)
}

#endif
