import { BreakPointType } from '../utils/BreakPointType'

interface MovieItem {
  title: string
  img: ResourceStr
}

@Entry
@Component
struct Page09_demo {
  @StorageProp('currentBreakpoint') curBp: string = 'sm'

  items: MovieItem[] = [
    { title: '电影标题1', img: $r('app.media.ic_video_grid_1') },
    { title: '电影标题2', img: $r('app.media.ic_video_grid_2') },
    { title: '电影标题3', img: $r('app.media.ic_video_grid_3') },
    { title: '电影标题4', img: $r('app.media.ic_video_grid_4') },
    { title: '电影标题5', img: $r('app.media.ic_video_grid_5') },
    { title: '电影标题6', img: $r('app.media.ic_video_grid_6') },
    { title: '电影标题7', img: $r('app.media.ic_video_grid_7') },
    { title: '电影标题8', img: $r('app.media.ic_video_grid_8') },
    { title: '电影标题9', img: $r('app.media.ic_video_grid_9') },
    { title: '电影标题10', img: $r('app.media.ic_video_grid_10') },
  ]

  build() {
    Grid() {
      ForEach(this.items, (item: MovieItem) => {
        GridItem() {
          Column({ space: 10 }) {
            Image(item.img)
              .borderRadius(10)
            Text(item.title)
              .width('100%')
              .fontSize(20)
              .fontWeight(600)

          }
        }
      })
    }
    .columnsTemplate(
      new BreakPointType({
        sm:'1fr 1fr',
        md:'1fr 1fr 1fr',
        lg:'1fr 1fr 1fr 1fr'
      })
        .getValue(this.curBp)
    )
    .rowsGap(10)
    .columnsGap(10)
    .padding(10)
  }
}