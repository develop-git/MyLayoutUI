//
//  TangramKit+margins.swift
//  TangramKit-Extra
//
//  Created by jian on 2023/8/11.
//

#if canImport(TangramKit)
import TangramKit

// MARK: ------- margins ------
public extension MyLayoutDSL {
    ///【Tangram: 充满剩余视图】
    @discardableResult
    func fill() -> Self {
        return self.width(.fill).height(.fill)
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右 边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func margin(_ len: CGFloat = 0) -> Self {
        let offset = CombinedLiteral(value: len)
        return self.top(offset).bottom(offset)
            .leading(offset).trailing(offset)
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右安全边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func marginsSafe(_ offset: CGFloat = 0) -> Self {
        let len = CombinedLiteral(value: offset)
        return self.topSafe(len).bottomSafe(len)
            .leadingSafe(len).trailingSafe(len)
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右 不同边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func margins(_ inset: UIEdgeInsets) -> Self {
        return self.top(CombinedLiteral(value: inset.top)).bottom(CombinedLiteral(value: inset.bottom))
            .leading(CombinedLiteral(value: inset.left)).trailing(CombinedLiteral(value: inset.right))
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右 不同安全边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func marginsSafe(_ inset: UIEdgeInsets) -> Self {
        return self.topSafe(CombinedLiteral(value: inset.top))
            .bottomSafe(CombinedLiteral(value: inset.bottom))
            .leadingSafe(CombinedLiteral(value: inset.left))
            .trailingSafe(CombinedLiteral(value: inset.right))
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右可选 安全边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func marginsSafe(_ edges: UIRectEdge, _ offset: CGFloat = 0) -> Self {
        let len = CombinedLiteral(value: offset)
        if edges.contains(.all) {
            return topSafe(len).bottomSafe(len)
                .leadingSafe(len).trailingSafe(len)
        }
        /// top
        if edges.contains(.top) {
            self.topSafe(len)
        }
        /// left
        if edges.contains(.left) {
            self.leadingSafe(len)
        }
        /// right
        if edges.contains(.right) {
            self.trailingSafe(len)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottomSafe(len)
        }
        return self
    }
    
    ///【Tangram: 以传入的数值设置当前对象的 上下左右可选 边距，默认 10 】
    /// 方法在相对布局中完全生效，对于水平布局：trailing不生效，对于垂直布局：bottom不生效
    /// 若要达到完全填充的目的，使用 size(.fill(.all))
    @discardableResult
    func margins(_ edges: UIRectEdge, _ offset: CGFloat = 0) -> Self {
        let len = CombinedLiteral(value: offset)
        if edges.contains(.all) {
            return self.top(len).bottom(len)
                .leading(len).trailing(len)
        }
        /// top
        if edges.contains(.top) {
            self.top(len)
        }
        /// left
        if edges.contains(.left) {
            self.leading(len)
        }
        /// right
        if edges.contains(.right) {
            self.trailing(len)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottom(len)
        }
        return self
    }
}

#endif
