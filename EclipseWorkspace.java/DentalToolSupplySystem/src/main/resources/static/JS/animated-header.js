document.addEventListener("DOMContentLoaded", () => {
    const canvas = document.getElementById("heroCanvas")
    if (!canvas) return

    const ctx = canvas.getContext("2d")
    let squares = []

    // Set canvas dimensions
    function resizeCanvas() {
        canvas.width = canvas.parentElement.offsetWidth
        canvas.height = canvas.parentElement.offsetHeight

        // Reinitialize squares when canvas is resized
        initSquares()
    }

    // Initialize squares
    function initSquares() {
        squares = []
        const numberOfSquares = Math.floor((canvas.width * canvas.height) / 15000) // Adjust density

        for (let i = 0; i < numberOfSquares; i++) {
            const size = Math.random() * 30 + 10 // Square size between 10px and 40px

            squares.push({
                x: Math.random() * canvas.width,
                y: canvas.height + Math.random() * 500, // Start below the canvas
                size: size,
                speed: Math.random() * 1 + 0.5, // Speed between 0.5 and 1.5
                opacity: Math.random() * 0.3 + 0.1, // Opacity between 0.1 and 0.4
                rotation: Math.random() * 45, // Rotation between 0 and 45 degrees
            })
        }
    }

    // Animation loop
    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height)

        // Update and draw squares
        squares.forEach((square, index) => {
            // Move square upward
            square.y -= square.speed

            // If square is out of view, reset its position
            if (square.y + square.size < 0) {
                square.y = canvas.height + square.size
                square.x = Math.random() * canvas.width
            }

            // Draw square
            ctx.save()
            ctx.translate(square.x + square.size / 2, square.y + square.size / 2)
            ctx.rotate((square.rotation * Math.PI) / 180)
            ctx.fillStyle = `rgba(255, 255, 255, ${square.opacity})`
            ctx.fillRect(-square.size / 2, -square.size / 2, square.size, square.size)
            ctx.restore()
        })

        requestAnimationFrame(animate)
    }

    // Initialize and start animation
    window.addEventListener("resize", resizeCanvas)
    resizeCanvas()
    animate()
})
