import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            ZStack {
                // 背上的紅色尖角
                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.17, height: h * 0.26)
                    .rotationEffect(.degrees(12))
                    .position(x: w * 0.58, y: h * 0.10)
                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.17, height: h * 0.26)
                    .rotationEffect(.degrees(12))
                    .position(x: w * 0.47, y: h * 0.10)

                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.25, height: h * 0.26)
                    .rotationEffect(.degrees(35))
                    .position(x: w * 0.68, y: h * 0.25)


                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.23, height: h * 0.26)
                    .rotationEffect(.degrees(90))
                    .position(x: w * 0.74, y: h * 0.35)

                
                Triangle()
                    .fill(.orange)
                    .frame(width: w * 0.13, height: h * 0.32)
                    .rotationEffect(.degrees(25))
                    .position(x: w * 0.36, y: h * 0.2)
                // 身體
                Ellipse()
                    .fill(.white)
                    .stroke(.black.opacity(1), lineWidth: 2)
                    .frame(width: w * 0.6, height: h * 0.72)
                    .position(x: w * 0.47, y: h * 0.54)
                // 尾巴
                TailShape().fill(.white).overlay {
                    TailShape()
                        .stroke(.black, lineWidth: 2)
                }
                .frame(width: w * 0.25, height: h * 0.49)
                .position(x: w * 0.82, y: h * 0.53)
                // 尾巴火
                TailFireShape()
                    .fill(.red)
                    .overlay {
                        TailFireShape()
                            .stroke(.black, lineWidth: 3)
                           
                    }
                    .frame(width: w*0.35,height: h*0.35)
                    .position(x: w * 0.92,y: h * 0.45)
                TailFireShape()
                    .fill(.red)
                    .overlay {
                        TailFireShape()
                            .stroke(.black, lineWidth: 3)
                           
                    }
                    .frame(width: w*0.20,height: h*0.20)
                    .position(x: w * 0.92,y: h * 0.5)
                // MARK: - 頭上的橘色尖角
                Triangle()
                    .fill(.orange)
                    .frame(width: w * 0.11, height: h * 0.26)
                    .rotationEffect(.degrees(35))
                    .position(x: w * 0.6, y: h * 0.2)

                


                // MARK: - 小紅眼
                Circle()
                    .fill(.red)
                    .frame(width: w * 0.035)
                    .position(x: w * 0.3, y: h * 0.45)
                Circle()
                    .fill(.red)
                    .frame(width: w * 0.035)
                    .position(x: w * 0.4, y: h * 0.45)
                // 右眼
                RightEyeShape()
                    .fill(Color(red: 0.85, green: 0.80, blue: 0.95))
                    .overlay {
                        RightEyeShape()
                            .stroke(.black, lineWidth: 4)
                    }
                    .frame(width: w * 0.065, height: h * 0.13)
                    .position(x: w * 0.27, y: h * 0.56)

                // 左眼
                LeftEyeShape()
                    .fill(Color(red: 0.85, green: 0.80, blue: 0.95))
                    .overlay {
                        LeftEyeShape()
                            .stroke(.black, lineWidth: 4)
                    }
                    .frame(width: w * 0.075, height: h * 0.16)
                    .position(x: w * 0.44, y: h * 0.56)

                // MARK: - 嘴巴
                MouthShape()
                    .stroke(
                        .black,
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .frame(width: w * 0.065, height: h * 0.035)
                    .position(x: w * 0.35, y: h * 0.67)

                // MARK: - 吊飾
                RoundedRectangle(cornerRadius: 3)
                    .fill(.red)
                    .frame(width: w * 0.075, height: h * 0.16)
                    .position(x: w * 0.75, y: h * 0.59)

                Rectangle()
                    .fill(.orange)
                    .frame(width: w * 0.065, height: h * 0.05)
                    .position(x: w * 0.75, y: h * 0.53)

                // 吊飾的線
                Path { path in
                    path.move(
                        to: CGPoint(x: w * 0.75, y: h * 0.45)
                    )
                    path.addLine(
                        to: CGPoint(x: w * 0.75, y: h * 0.50)
                    )
                }
                .stroke(.red, lineWidth: 3)
                

                // MARK: - 腳
                Capsule()
                    .fill(.red)
                    .frame(width: w * 0.075, height: h * 0.075)
                    .rotationEffect(.degrees(8))
                    .position(x: w * 0.33, y: h * 0.86)

                Capsule()
                    .fill(.red)
                    .frame(width: w * 0.075, height: h * 0.075)
                    .rotationEffect(.degrees(-8))
                    .position(x: w * 0.60, y: h * 0.86)
            }
        }
        .aspectRatio(1.35, contentMode: .fit)
    }
}

// MARK: - 三角形
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.maxY
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.minX,
                y: rect.maxY
            )
        )

        path.closeSubpath()

        return path
    }
}

// 左眼睛
struct LeftEyeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.maxX,
                y: rect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.maxY
            ),
            
        )
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.width/2,
            startAngle: .degrees(0),    // 0度為正右方（3點鐘方向）
            endAngle: .degrees(180),    // 順時針或逆時針旋轉至 180 度
            clockwise: false            // false 為順時針，true 為逆時針
        )

        path.addLine(
            to: CGPoint(
                x: rect.minX,
                y: (rect.minY + rect.height*0.2),
            ),
            
        )
        path.addLine(
            to: CGPoint(
                x: rect.minX - rect.width*0.5,
                y:(rect.minY + rect.height * 0.3)
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.maxX + rect.width*0.5,
                y:(rect.minY - rect.height * 0.2)
            )
        )

        return path
    }
}
// 右眼睛
struct RightEyeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.maxX,
                y: (rect.minY + rect.height * 0.2),
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.maxY
            ),
            
        )
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.width/2,
            startAngle: .degrees(0),    // 0度為正右方（3點鐘方向）
            endAngle: .degrees(180),    // 順時針或逆時針旋轉至 180 度
            clockwise: false            // false 為順時針，true 為逆時針
        )

        path.addLine(
            to: CGPoint(
                x: rect.minX,
                y: rect.minY,
            ),
            
        )
        path.addLine(
            to: CGPoint(
                x: rect.minX - rect.width*0.5,
                y:(rect.minY - rect.height * 0.2)
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.maxX + rect.width*0.5,
                y:(rect.minY + rect.height * 0.3)
            )
        )

        return path
    }
}

struct TailShape: Shape {
    func path(in rect:CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.minY
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x:rect.maxX,
                y:rect.maxY*0.6
            ),
            control:CGPoint(
                x:rect.maxX*0.7,
                y:rect.maxY*0.85
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x:rect.minX,
                y:rect.maxY
            ),
            control:CGPoint(
                x:rect.maxX*0.8,
                y:rect.maxY*0.9
            )
        )
        return path
    }
}

// MARK: - 嘴巴
struct MouthShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.midY
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY
            ),
            control: CGPoint(
                x: rect.width * 0.25,
                y: rect.maxY
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.maxX,
                y: rect.midY
            ),
            control: CGPoint(
                x: rect.width * 0.75,
                y: rect.maxY
            )
        )

        return path
    }
}
struct TailFireShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.minY
            )
        )

        path.addQuadCurve(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY
            ),
            control: CGPoint(
                x: rect.maxX,
                y: rect.maxY*0.7
            )
        )
        path.addQuadCurve(
            to: CGPoint(
                x: rect.midX,
                y: rect.minY
            ),
            control: CGPoint(
                x: rect.minX,
                y: rect.maxY*0.7
            )
        )




        path.closeSubpath()

        return path
    }
}

#Preview {
    ZStack {
        Color.white

        ContentView()
            .frame(width: 350, height: 260)
    }
}
