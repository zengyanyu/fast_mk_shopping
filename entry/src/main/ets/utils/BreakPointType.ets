// utils/BreakpointType
declare interface BreakPointTypeOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}

// 1. 实例化 并传入不同断点的结果
// 2. 调用 getValue 传入断点值即可
export class BreakPointType<T> {
  options: BreakPointTypeOption<T>

  constructor(option: BreakPointTypeOption<T>) {
    this.options = option
  }

  getValue(currentBreakPoint: string) {
    if (currentBreakPoint === 'xs') {
      return this.options.xs
    } else if (currentBreakPoint === 'sm') {
      return this.options.sm
    } else if (currentBreakPoint === 'md') {
      return this.options.md
    } else if (currentBreakPoint === 'lg') {
      return this.options.lg
    } else {
      return undefined
    }
  }
}