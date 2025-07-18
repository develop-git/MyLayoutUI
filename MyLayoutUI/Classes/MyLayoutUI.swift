//
//  UIView+Layout.swift
//  TangramKit-Extra
//
//  Created by jian on 2022/12/21.
//

#if canImport(TangramKit)
import TangramKit

public extension TGViewSizeClass {
    var lyt: MyLayoutDSL {
        return MyLayoutDSL(sizeClass: self)
    }
}

public extension UIView {
    
    /// 调用TangramKit布局视图
    /// - Parameter view: 需要布局的视图
    /// - Returns: 布局DSL
    @discardableResult
    func add(to view: UIView) -> MyLayoutDSL {
        view.addSubview(self)
        return self.lyt
    }
}

// MARK: 布局视图TGBaseLayout及其子类具有的方法
// MARK: 子视图间距（space） 及 对齐（gravity）
public extension MyLayoutDSL {
    
    /// 【TangramKit】子视图间距 仅对线性布局有效
    /// 对线性布局而言：相邻视图的间距
    /// - Parameters:
    ///   - value:   间距值
    @discardableResult
    func space(_ value: CGFloat) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_space = value
        return self
    }
    
    /// 【TangramKit】子视图间距 仅对线性布局有效
    /// 对线性布局而言：相邻视图的间距
    /// - Parameters:
    ///   - value:   间距值
    @discardableResult
    func space(vert value: CGFloat) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_vspace = value
        return self
    }
    
    /// 【TangramKit】子视图间距 仅对线性布局有效
    /// 对线性布局而言：相邻视图的间距
    /// - Parameters:
    ///   - value:   间距值
    @discardableResult
    func space(horz value: CGFloat) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_hspace = value
        return self
    }
}

public extension MyLayoutDSL {
    /// 【TangramKit】子视图布局方式
    /// - Parameters:
    ///   - val:   布局视图布局方式
    @discardableResult
    func gravity(_ val: TGGravity) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_gravity = val
        return self
    }
}

// MARK: 移除子视图、添加安全区域、屏幕旋转
public extension MyLayoutDSL {
    ///【TangramKit】移除子布局视图
    @discardableResult
    func removeAllSubLayouts() -> Self {
        (sizeClass as? TGBaseLayout)?.tg_removeAllSubviews()
        return self
    }
    
    /// 【TangramKit】布局试图添加安全区域
    /// - Parameters:
    ///   - rectEdge: 安全区域
    ///   - 设置 .none时，为移除安全区域
    @discardableResult
    func addSafeArea(for rectEdge: UIRectEdge) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_insetsPaddingFromSafeArea = rectEdge
        return self
    }
    
    /// 【TangramKit】布局试图添加安全区域
    /// - Parameters:
    ///   - isAdd: 是否添加安全区域（上、下、左、右）
    @discardableResult
    func addSafeArea(_ isAdd: Bool) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_insetsPaddingFromSafeArea = isAdd ? .all : UIRectEdge(rawValue: 0)
        return self
    }
}

public extension MyLayoutDSL {
    /** 监听布局变化
      - layout: 参数就是布局视图本身
      - isFirst: 表明当前是否是第一次布局时调用。
      - isPortrait: 表明当前是横屏还是竖屏。
     */
    @discardableResult
    func screenRotation(action: @escaping(_ layout: TGBaseLayout, _ isFirst: Bool, _ isPortrait: Bool)->Void) -> Self {
        (sizeClass as? TGBaseLayout)?.tg_rotationToDeviceOrientationDo {layout, isFirst, isPortrait in
            action(layout, isFirst, isPortrait)
        }
        return self
    }
}

// MARK: 布局视图TGBaseLayout子类布局类
// MARK: 布局方向、布局压缩方式、
public extension MyLayoutDSL {
    /// 【TangramKit】设置序列布局方向
    /// - Parameters:
    ///   - orientation: 布局方向
    @discardableResult
    func orientation(_ orientation: TGOrientation) -> Self {
        (sizeClass as? TGSequentLayoutViewSizeClass)?.tg_orientation = orientation
        return self
    }
}

public extension MyLayoutDSL {
    /// 【TangramKit】设置线性布局子视图压缩类型
    /// - Parameters:
    ///   - type: 压缩类型
    @discardableResult
    func shrinkType(_ type: TGSubviewsShrinkType) -> Self {
        (sizeClass as? TGLinearLayoutViewSizeClass)?.tg_shrinkType = type
        return self
    }
}

// MARK: 所有视图及布局类具有的方法 布局回调、布局类、是否可见
public extension MyLayoutDSL {
    
    /// 【TangramKit】是否反转浮动布局的浮动方向
    /// - Parameters:
    ///   - reverse: 是否反转
    @discardableResult
    func reverseFloat(_ reverse: Bool) -> Self {
        sizeClass.tg_reverseFloat = reverse
        return self
    }
    
    /// 【TangramKit】清除浮动布局 效果：在浮动布局中，此视图不会紧跟上一个浮动子视图，而是在浮动布局方向另起一行开始布局
    /// - Parameters:
    ///   - clear: 是否清除布局
    @discardableResult
    func clearFloat(_ clear: Bool) -> Self {
        sizeClass.tg_clearFloat = clear
        return self
    }
}

public extension MyLayoutDSL {
    /// 转换线性布局
    @discardableResult
    func asLinear() -> TGLinearLayoutViewSizeClass? {
        sizeClass as? TGLinearLayoutViewSizeClass
    }
    /// 转换相对布局
    @discardableResult
    func asRelative() -> TGRelativeLayoutViewSizeClass? {
        sizeClass as? TGRelativeLayoutViewSizeClass
    }
    /// 转换流式布局
    @discardableResult
    func asFlow() -> TGFlowLayoutViewSizeClass? {
        sizeClass as? TGFlowLayoutViewSizeClass
    }
    /// 转换浮动布局
    @discardableResult
    func asFloat() -> TGFloatLayoutViewSizeClass? {
        sizeClass as? TGFloatLayoutViewSizeClass
    }
}

public extension MyLayoutDSL {
    /// 设置流式布局列数
    @discardableResult
    func columns(_ num: Int) -> Self {
        (sizeClass as? TGFlowLayoutViewSizeClass)?.tg_arrangedCount = num
        return self
    }
    /// 设置流式布局分页数
    @discardableResult
    func pages(_ num: Int) -> Self {
        (sizeClass as? TGFlowLayoutViewSizeClass)?.tg_pagedCount = num
        return self
    }
}

public extension MyLayoutDSL {
    /// 【TangramKit】视图是否可见
    /// - Parameters:
    ///   - visible:   显示方式
    @discardableResult
    func visible(_ visible: TGVisibility) -> Self {
        sizeClass.tg_visibility = visible
        return self
    }
}

#endif

public extension CGFloat {
    static var defaultOffset: CGFloat { 10 }
}

public extension Int {
    static var defaultOffset: Int { 10 }
}
