# Follow the pointer at the edge of a zoomed stream

The iOS stream pans when a moving cursor tip reaches an eight-point inset. Its position comes from the aspect-fit video rectangle, and both touch input and drawing use the same zoom model. The full picture keeps its framing. A hardware mouse held at the edge on iPad scrolls the picture beneath the system cursor until it leaves the edge or reaches the end.

The stream-zoom checks cover all four edges, diagonal motion, image bounds and the 1× view. The 118 zoom checks and all 76 check groups passed. The Mac release and the arm64 iOS Simulator app built successfully.

The review reproduced a stationary mouse scrolling diagonally off the video into a black bar and stopping early. The native pointer now stops each axis at the video boundary independently. The checks cover the black bar, the exact pane boundary and continued motion along the other axis.
