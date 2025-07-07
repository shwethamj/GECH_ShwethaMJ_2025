document.addEventListener("DOMContentLoaded", () => {
    const canvas = document.getElementById("heroCanvas");
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    let squares = [];

    // Resize canvas to fit the section
    function resizeCanvas() {
        const heroSection = document.querySelector(".category-hero");
        canvas.width = heroSection.offsetWidth;
        canvas.height = heroSection.offsetHeight;
        initSquares();
    }

    // Initialize floating squares
    function initSquares() {
        squares = [];
        const numberOfSquares = Math.floor((canvas.width * canvas.height) / 15000);

        for (let i = 0; i < numberOfSquares; i++) {
            const size = Math.random() * 30 + 10;
            squares.push({
                x: Math.random() * canvas.width,
                y: canvas.height + Math.random() * 500,
                size,
                speed: Math.random() * 1 + 0.5,
                opacity: Math.random() * 0.3 + 0.1,
                rotation: Math.random() * 45,
            });
        }
    }

    // Draw animation frame
    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        squares.forEach((square) => {
            square.y -= square.speed;

            if (square.y + square.size < 0) {
                square.y = canvas.height + square.size;
                square.x = Math.random() * canvas.width;
            }

            ctx.save();
            ctx.translate(square.x + square.size / 2, square.y + square.size / 2);
            ctx.rotate((square.rotation * Math.PI) / 180);
            ctx.fillStyle = `rgba(255, 255, 255, ${square.opacity})`;
            ctx.fillRect(-square.size / 2, -square.size / 2, square.size, square.size);
            ctx.restore();
        });

        requestAnimationFrame(animate);
    }

    window.addEventListener("resize", resizeCanvas);
    resizeCanvas();
    animate();
});
