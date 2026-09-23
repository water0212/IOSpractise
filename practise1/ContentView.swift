import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            ZStack {
                // MARK: - 尾巴
                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.18, height: h * 0.25)
                    .rotationEffect(.degrees(90))
                    .position(x: w * 0.90, y: h * 0.57)

                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.13, height: h * 0.20)
                    .rotationEffect(.degrees(90))
                    .position(x: w * 0.82, y: h * 0.55)

                // MARK: - 身體
                Ellipse()
                    .fill(.white)
                    .stroke(.gray.opacity(0.3), lineWidth: 2)
                    .frame(width: w * 0.68, height: h * 0.60)
                    .position(x: w * 0.49, y: h * 0.55)

                // MARK: - 頭上的紅色尖角
                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.13, height: h * 0.19)
                    .rotationEffect(.degrees(-12))
                    .position(x: w * 0.27, y: h * 0.28)

                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.16, height: h * 0.25)
                    .position(x: w * 0.43, y: h * 0.20)

                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.15, height: h * 0.28)
                    .rotationEffect(.degrees(12))
                    .position(x: w * 0.56, y: h * 0.24)

                Triangle()
                    .fill(.red)
                    .frame(width: w * 0.11, height: h * 0.18)
                    .position(x: w * 0.66, y: h * 0.28)

                // MARK: - 小紅眼
                Circle()
                    .fill(.red)
                    .frame(width: w * 0.035)
                    .position(x: w * 0.35, y: h * 0.48)

                // MARK: - 左眼
                EyeShape()
                    .fill(Color(red: 0.85, green: 0.80, blue: 0.95))
                    .overlay {
                        EyeShape()
                            .stroke(.black, lineWidth: 4)
                    }
                    .frame(width: w * 0.075, height: h * 0.16)
                    .position(x: w * 0.27, y: h * 0.56)

                // MARK: - 右眼
                EyeShape()
                    .fill(Color(red: 0.85, green: 0.80, blue: 0.95))
                    .overlay {
                        EyeShape()
                            .stroke(.black, lineWidth: 4)
                    }
                    .frame(width: w * 0.095, height: h * 0.18)
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
                    .position(x: w * 0.33, y: h * 0.67)

                // MARK: - 吊飾
                RoundedRectangle(cornerRadius: 3)
                    .fill(.red)
                    .frame(width: w * 0.065, height: h * 0.22)
                    .position(x: w * 0.59, y: h * 0.56)

                Rectangle()
                    .fill(.orange)
                    .frame(width: w * 0.065, height: h * 0.07)
                    .position(x: w * 0.59, y: h * 0.455)

                // 吊飾的線
                Path { path in
                    path.move(
                        to: CGPoint(x: w * 0.59, y: h * 0.38)
                    )
                    path.addLine(
                        to: CGPoint(x: w * 0.59, y: h * 0.45)
                    )
                }
                .stroke(.red, lineWidth: 3)

                // MARK: - 腳
                Capsule()
                    .fill(.red)
                    .frame(width: w * 0.13, height: h * 0.075)
                    .rotationEffect(.degrees(8))
                    .position(x: w * 0.36, y: h * 0.83)

                Capsule()
                    .fill(.red)
                    .frame(width: w * 0.13, height: h * 0.075)
                    .rotationEffect(.degrees(-8))
                    .position(x: w * 0.62, y: h * 0.83)
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

// MARK: - 眼睛
struct EyeShape: Shape {
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
        path.addCurve(
            to: CGPoint(
                x: rect.minX,
                y: rect.maxY
            ),
            
            control1:
            CGPoint(
                x:rect.maxX,
                y:rect.height
            ),
            control2:
            CGPoint(
                    x:rect.minX,
                    y:rect.height
                )
            
        )

        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY
            ),
            
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

#Preview {
    ZStack {
        Color.white

        ContentView()
            .frame(width: 350, height: 260)
    }
}
