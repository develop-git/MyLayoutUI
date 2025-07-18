//
//  Tangram+Size.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/10.
//

#if canImport(TangramKit)
import TangramKit

// MARK: ------- size -------
public extension MyLayoutDSL {
    ///【TangramKit：将传入的数值赋值给当前对象的 width & height】
    @discardableResult
    func size(_ value: CGFloat) -> Self {
        return self.width(CombinedLiteral(value: value))
            .height(CombinedLiteral(value: value))
    }
    
    ///【TangramKit: 将传入的动态类型赋值给当前对象的 width & height】
    @discardableResult
    func size(_ size: DynamicLayoutType) -> Self {
        return self.width(size).height(size)
    }
    
    ///【TangramKit: 将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要 width 动态变化，可设置 为 .max/.min/.in
    @discardableResult
    func size(width: CombinedLiteral,
              height: CombinedLiteral) -> Self {
        return self.width(width)
            .height(height)
    }
    
    ///【TangramKit: 将传入的动态类型赋值给当前对象的 width & height】
    @discardableResult
    func size(width: DynamicLayoutType,
              height: DynamicLayoutType) -> Self {
        return self.width(width)
            .height(height)
    }
    
    ///【TangramKit: 将传入视图的width/height赋值给当前对象的 width & height】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func size(by anchor: ViewSizeAnchor?,
              widthMult: CombinedLiteral = .one,
              heightMult: CombinedLiteral = .one) -> Self {
        return self.width(by: anchor, mult: widthMult)
            .height(by: anchor, mult: heightMult)
    }
    
    ///【TangramKit: 将传入视图的size赋值给当前对象的size】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func size(by sizeClass: TGViewSizeClass,
              widthMult: CombinedLiteral = .one,
              heightMult: CombinedLiteral = .one) -> Self {
        return self.width(by: sizeClass.lyt.width, mult: widthMult)
            .height(by: sizeClass.lyt.height, mult: heightMult)
    }
}

// MARK: ------- width,height -------
// MARK: width
public extension MyLayoutDSL {
    
    ///【TangramKit:  width】
    /// 若需要 width 动态变化，可设置 为 .max/.min/.in
    @discardableResult
    func width(_ width: CombinedLiteral, add: CGFloat = .zero) -> Self {
        return multipliedBy(width.raw.range, for:.width, extra:width, add: add)
    }
    
    ///【TangramKit: 将传入的动态类型赋值给当前对象的 width】
    @discardableResult
    func width(_ width: DynamicLayoutType) -> Self {
        switch width {
        case .fill:
            sizeClass.lyt.width.origin.equal(.fill)
        case .wrap:
            sizeClass.lyt.width.origin.equal(.wrap)
        }
        return self
    }
    
    ///【TangramKit: 将传入视图的width/height赋值给当前对象的 width】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func width(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one, add: CGFloat = .zero) -> Self {
        return multipliedBy(anchor, for:.width, extra:mult, add: add)
    }
    
    ///【TangramKit: 将传入视图的width赋值给当前对象的 width】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func width(by sizeClass: TGViewSizeClass, mult: CombinedLiteral = .one, add: CGFloat = .zero) -> Self {
        return multipliedBy(sizeClass.lyt.width, for:.width, extra:mult, add: add)
    }
}

// MARK: height
public extension MyLayoutDSL {
    
    ///【TangramKit: height】
    /// 若需要 height 动态变化，可设置 为 .max/.min/.in
    @discardableResult
    func height(_ height: CombinedLiteral, add: CGFloat = .zero) -> Self {
        return multipliedBy(height.raw.range, for:.height, extra:height, add: add)
    }
    
    ///【TangramKit: 将传入的动态类型赋值给当前对象的 height】
    @discardableResult
    func height(_ height: DynamicLayoutType) -> Self {
        switch height {
        case .fill:
            sizeClass.lyt.height.origin.equal(.fill)
        case .wrap:
            sizeClass.lyt.height.origin.equal(.wrap)
        }
        return self
    }
    
    ///【TangramKit: 将传入视图的width/height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func height(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one, add: CGFloat = .zero) -> Self {
        return multipliedBy(anchor, for:.height, extra:mult, add: add)
    }
    
    ///【TangramKit: 将传入视图的height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max/.min/.in
    @discardableResult
    func height(by sizeClass: TGViewSizeClass, mult: CombinedLiteral = .one, add: CGFloat = .zero) -> Self {
        return multipliedBy(sizeClass.lyt.height, for:.height, extra:mult, add: add)
    }
}
#endif
