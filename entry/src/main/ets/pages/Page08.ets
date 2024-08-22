import { BreakPointType } from '../utils/BreakPointType';

@Entry
@Component
struct Page08 {
  @State message: string = 'Hello World';
  @StorageProp('currentBreakpoint') curBp: string = 'sm'

  build() {
    RelativeContainer() {
      Text(this.curBp)
        .width(100)
        .height(100)
        .backgroundColor(
          new BreakPointType({
            sm: Color.Red,
            md: Color.Yellow,
            lg: Color.Blue,
          }).getValue(this.curBp)
        )

      // Image(this.curBp==='sm'?$r('app.media.ic_nav_01'):$r('app.media.ic_nav_03'))
      // sm 图片 1
      // md 图片 2
      // lg 图片 3
      Image(new BreakPointType({
        sm: $r('app.media.ic_nav_01'),
        md: $r('app.media.ic_nav_02'),
        lg: $r('app.media.ic_nav_03'),
      }).getValue(this.curBp))
        .width(300)
    }
    .height('100%')
    .width('100%')
  }
}