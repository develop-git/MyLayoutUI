//
//  MyLayoutDSL.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/10.
//


#if canImport(TangramKit)
import TangramKit

public class MyLayoutDSL {

    public var sizeClass: TGViewSizeClass
    required public init(sizeClass: TGViewSizeClass) {
        self.sizeClass = sizeClass
    }
}

internal extension MyLayoutDSL {
    @discardableResult
    func multipliedBy<T>(_ target: T?,
                         for index: LayoutAttribute,
                         extra: CombinedLiteral,
                         add: CGFloat = .zero) -> Self {

        guard let target = target, let item = layoutAnchor(at: index) as? ViewSizeAnchor else { return self }
        
        let relation = extra.raw.relation
        let val = extra.raw.range
        
        if let size = target as? ClosedRange<CGFloat> {
            switch relation {
            case .equal:
                item.origin.equal(size.lowerBound, increment: add)
            case .min:
                item.origin.equal(.wrap)
                    .min(size.lowerBound, increment: add)
            case .max:
                item.origin.equal(.wrap)
                    .max(size.lowerBound, increment: add)
            case .range:
                item.origin.equal(.wrap)
                    .min(size.lowerBound, increment: add)
                    .max(size.upperBound, increment: add)
            }
            return self
        }
        
        if let target = target as? ViewSizeAnchor {
            switch relation {
            case .equal:
                item.origin.equal(target.origin, increment: add, multiple: val.lowerBound)
            case .min:
                item.origin.equal(.wrap)
                    .min(target.origin, increment: add, multiple: val.lowerBound)
            case .max:
                item.origin.equal(.wrap)
                    .max(target.origin, increment: add, multiple: val.lowerBound)
            case .range:
                item.origin.equal(.wrap)
                    .min(target.origin, increment: add, multiple: val.lowerBound)
                    .max(target.origin, increment: add, multiple: val.upperBound)
            }
        }
        return self
    }
    
    @discardableResult
    func offsetBy(_ anchor: TangramConstraintAnchor?,
                  for index: LayoutAttribute,
                  extra: CombinedLiteral) -> Self {

        guard let target = anchor, let item = layoutAnchor(at: index) else { return self }
        return itemOffset(target: target, item: item, offset: extra)
    }
    
    @discardableResult
    func offsetBy(_ vale: CombinedLiteral,
                  for index: LayoutAttribute,
                  inSafe: Bool = false) -> Self {

        guard let target = layoutAnchor(at: index) else { return self }
        return valueOffset(target: target, offset: vale, inSafe: inSafe)
    }
}


extension MyLayoutDSL {
   
    public var width: ViewSizeAnchor {
        return ViewSizeAnchor(origin: sizeClass.tg_width, sizeClass: sizeClass)
    }

    public var height: ViewSizeAnchor {
        return ViewSizeAnchor(origin: sizeClass.tg_height, sizeClass: sizeClass)
    }
}

extension MyLayoutDSL {
    
    // MARK: - y-axis (top bottom centerY)
    public var top: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: sizeClass.tg_top, sizeClass: sizeClass)
    }

    public var bottom: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: sizeClass.tg_bottom, sizeClass: sizeClass)
    }

    public var centerY: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: sizeClass.tg_centerY, sizeClass: sizeClass)
    }
    
    // MARK: - x-axis (leading trailing centerX)

    public var leading: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: sizeClass.tg_leading, sizeClass: sizeClass)
    }
    
    public var trailing: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: sizeClass.tg_trailing, sizeClass: sizeClass)
    }

    public var centerX: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: sizeClass.tg_centerX, sizeClass: sizeClass)
    }
}

private extension MyLayoutDSL {
    
    private func valueOffset<T>(target: T, offset: CombinedLiteral, inSafe: Bool) -> Self {
        
        let maxValue = safeValue(offset.raw.range.upperBound, inSafe)
        let maxGlobal = safeOffset(offset.raw.range.upperBound, inSafe)
        
        let safeValue = safeValue(offset.raw.range.lowerBound, inSafe)
        let safeOffset = safeOffset(offset.raw.range.lowerBound, inSafe)
        
        if let item = target as? ViewXaxisAnchor {
            switch offset.raw.relation {
            case .equal:
                item.origin.equal(safeValue, offset: safeOffset)
            case .min:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.min(safeValue, offset: safeOffset)
            case .max:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.max(safeValue, offset: safeOffset)
            case .range:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.min(safeValue, offset: safeOffset)
                    .max(maxValue, offset: maxGlobal)
            }
            return self
        }
        
        if let item = target as? ViewYaxisAnchor {
            
            switch offset.raw.relation {
            case .equal:
                item.origin.equal(safeValue, offset: safeOffset)
            case .min:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.min(safeValue, offset: safeOffset)
            case .max:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.max(safeValue, offset: safeOffset)
            case .range:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.min(safeValue, offset: safeOffset)
                    .max(maxValue, offset: maxGlobal)
            }
            return self
        }
        return self
    }
    
    private func itemOffset(target: TangramConstraintAnchor,item: TangramConstraintAnchor, offset: CombinedLiteral) -> Self {
        
        if let target = target as? ViewXaxisAnchor, let item = item as? ViewXaxisAnchor {
            switch offset.raw.relation {
            case .equal:
                item.origin.equal(target.origin, offset: offset.raw.range.lowerBound)
            case .min:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.min(target.origin, offset: offset.raw.range.lowerBound)
            case .max:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.max(target.origin, offset: offset.raw.range.lowerBound)
            case .range:
                item.sizeClass.tg_width.equal(.wrap)
                item.origin.min(target.origin, offset: offset.raw.range.lowerBound)
                            .max(target.origin, offset: offset.raw.range.upperBound)
                    
            }
            return self
        }
        
        if let target = target as? ViewYaxisAnchor, let item = item as? ViewYaxisAnchor {
            switch offset.raw.relation {
            case .equal:
                item.origin.equal(target.origin, offset: offset.raw.range.lowerBound)
            case .min:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.min(target.origin, offset: offset.raw.range.lowerBound)
            case .max:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.max(target.origin, offset: offset.raw.range.lowerBound)
            case .range:
                item.sizeClass.tg_height.equal(.wrap)
                item.origin.min(target.origin, offset: offset.raw.range.lowerBound)
                           .max(target.origin, offset: offset.raw.range.upperBound)
            }
        }
        return self
    }
    
    private func safeValue(_ val: CGFloat, _ isSafe: Bool) -> CGFloat {
        return isSafe ? TGLayoutPos.tg_safeAreaMargin : val
    }
    
    private func safeOffset(_ val: CGFloat, _ isSafe: Bool) -> CGFloat {
        return isSafe ? val : 0
    }
    
    private func layoutAnchor(at index: LayoutAttribute) -> TangramConstraintAnchor? {
        switch index {
        case .leading:
            return sizeClass.lyt.leading
        case .trailing:
            return sizeClass.lyt.trailing
        case .centerX:
            return sizeClass.lyt.centerX
        case .top:
            return sizeClass.lyt.top
        case .bottom:
            return sizeClass.lyt.bottom
        case .centerY:
            return sizeClass.lyt.centerY
        case .width:
            return sizeClass.lyt.width
        case .height:
            return sizeClass.lyt.height
        }
    }
}
#endif
