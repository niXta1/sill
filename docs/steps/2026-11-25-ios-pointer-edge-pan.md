# Follow the pointer at the edge of a zoomed stream

The iOS stream pans when a moving cursor tip reaches an eight-point inset. Its position comes from the aspect-fit video rectangle, and both touch input and drawing use the same zoom model. The full picture keeps its framing. A hardware mouse held at the edge on iPad scrolls the picture beneath the system cursor until it leaves the edge or reaches the end.

The stream-zoom checks cover all four edges, diagonal motion, image bounds and the 1× view. The 114 zoom checks and all 76 check groups passed. The Mac release and the arm64 iOS Simulator app built successfully.
