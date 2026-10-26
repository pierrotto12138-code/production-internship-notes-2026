"""生成 README 首屏横幅 `配图/hero.jpg`（可重复运行）。

素材（均为仓库内已有截图，不引入新内容）：
  左  配图/Day1_images/image-0910_vertex_result.png   视觉：齿轮顶点检测结果
  右  配图/Day2_images/image-0913_rs_path10_contour.png 机器人：RobotStudio 轨迹仿真

做法：白底 1600x640 画布，两张图等比缩放后留白居中，JPEG q88。
改素材或尺寸只需改本文件常量；生成后请目视确认可读性，并跑一次链接校验。
"""
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "配图" / "hero.jpg"

CANVAS = (1600, 640)
BG = (255, 255, 255)
MARGIN = 24
GAP = 32

LEFT_SRC = ROOT / "配图" / "Day1_images" / "image-0910_vertex_result.png"
LEFT_CROP = (0, 0, 954, 1104)  # 整幅（含底部顶点结果表，与右侧截图等高）
LEFT_BOX = (560, 600)

RIGHT_SRC = ROOT / "配图" / "Day2_images" / "image-0913_rs_path10_contour.png"
RIGHT_BOX = (960, 600)


def fit(img: Image.Image, box: tuple[int, int]) -> Image.Image:
    """等比缩放到 box 内，不裁剪。"""
    scale = min(box[0] / img.width, box[1] / img.height)
    size = (max(1, round(img.width * scale)), max(1, round(img.height * scale)))
    return img.resize(size, Image.LANCZOS)


def main() -> None:
    canvas = Image.new("RGB", CANVAS, BG)

    left = fit(Image.open(LEFT_SRC).convert("RGB").crop(LEFT_CROP), LEFT_BOX)
    left_x = MARGIN
    left_y = (CANVAS[1] - left.height) // 2
    canvas.paste(left, (left_x, left_y))

    right = fit(Image.open(RIGHT_SRC).convert("RGB"), RIGHT_BOX)
    right_x = left_x + LEFT_BOX[0] + GAP
    right_y = (CANVAS[1] - right.height) // 2
    canvas.paste(right, (right_x, right_y))

    OUT.parent.mkdir(parents=True, exist_ok=True)
    canvas.save(OUT, "JPEG", quality=88, optimize=True, progressive=True)
    print(f"{OUT.relative_to(ROOT)}  {canvas.width}x{canvas.height}  {OUT.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
