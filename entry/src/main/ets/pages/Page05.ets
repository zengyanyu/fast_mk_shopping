import { NavItem } from './Page02'


// readonly 只读


@Entry
@Component
struct Page05 {
  @State rate: number = 100
  // 数组
  readonly appList: NavItem [] = [
    { id: 1, icon: $r('app.media.ic_nav_01'), title: '淘金币' },
    { id: 2, icon: $r('app.media.ic_nav_02'), title: '摇现金' },
    { id: 3, icon: $r('app.media.ic_nav_03'), title: '闲鱼' },
    { id: 4, icon: $r('app.media.ic_nav_04'), title: '中通快递' },
    { id: 5, icon: $r('app.media.ic_nav_05'), title: '芭芭农场' },
    { id: 6, icon: $r('app.media.ic_nav_06'), title: '淘宝珍库' },
    { id: 7, icon: $r('app.media.ic_nav_07'), title: '阿里拍卖' },
    { id: 8, icon: $r('app.media.ic_nav_08'), title: '阿里药房' },
  ]

  info:string =''
  // 只读属性 readonly 无法重新赋值
  readonly infoPlus:string = ''

  aboutToAppear(): void {
    this.info='么么哒'
    // this.infoPlus='滚犊子'
    // this.appList=[]
    // this.appList.push()
  }

  // 底部滑块，可以通过拖拽滑块改变容器尺寸
  @Builder
  slider() {
    Slider({
      value: this.rate,
      min: 100,
      max: 730,
      style: SliderStyle.OutSet
    })
      .onChange((value)=>{
        this.rate = value;
      })
      .blockColor(Color.White)
      .width('60%')
      .height(50)

      .position({ x: '20%', y: '80%' })
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      // 展示宽度
      Text('宽度:' + this.rate.toFixed(0))
        .zIndex(2)
        .translate({ x: 20, y: 20 })
        .fontColor(Color.Orange)

      Column() {
        Row({ space: 10 }) {
          // 布局能力 5：延伸能力
          // 容器组件内的子组件，按照其在列表中的先后顺序，随容器组件尺寸变化【显示或隐藏】

          // 实现方式：
          // 1.List 组件
          // 2.Scroll 配合 Row 或者 Column
          // 核心：调整父容器的尺寸，让页面中显示的组件数量发生改变

          // 通过List组件实现隐藏能力
          List({ space: 10 }) {
            ForEach(this.appList, (item: NavItem) => {
              ListItem() {
                Column() {
                  Image(item.icon)
                    .width(48)
                    .height(48)
                    .margin({ top: 8 })
                  Text(item.title)
                    .width(64)
                    .height(30)
                    .lineHeight(15)
                    .fontSize(12)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 8 })
                    .padding({ bottom: 15 })
                }
                .width(80)
                .height(102)
              }
              .width(80)
              .height(102)
            })
          }
          .padding({ top: 16, left: 10 })
          .listDirection(Axis.Horizontal)
          .width('100%')
          .height(118)
          .borderRadius(16)
          .backgroundColor(Color.White)

          // 通过Scroll 组件实现隐藏能力
          // Scroll() {
          //   Row({ space: 10 }) {
          //     ForEach(this.appList, (item: NavItem, index: number) => {
          //       Column() {
          //         Image(item.icon)
          //           .width(48)
          //           .height(48)
          //           .margin({ top: 8 })
          //         Text(item.title)
          //           .width(64)
          //           .height(30)
          //           .lineHeight(15)
          //           .fontSize(12)
          //           .textAlign(TextAlign.Center)
          //           .margin({ top: 8 })
          //           .padding({ bottom: 15 })
          //       }
          //       .width(80)
          //       .height(102)
          //     })
          //   }
          // }
          // .scrollable(ScrollDirection.Horizontal) // 设置横向滚动
          // .padding({ top: 16, left: 10 })
          // .height(118)
          // .borderRadius(16)
          // .backgroundColor(Color.White)
        }
        .width(this.rate)

        this.slider()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }

  }
}