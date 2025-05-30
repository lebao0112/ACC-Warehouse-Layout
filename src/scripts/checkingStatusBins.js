var bins = [];
var binRects = [];

const backgroundImage = document.createElement("img");

/**
 * Hàm setImage
 * Thiết lập ảnh nền cho layout bằng chuỗi base64.
 * @param {string} imageBase64 - Chuỗi base64 của ảnh nền.
 */
function setImage(imageBase64) {
    backgroundImage.src = `data:image/jpeg;base64,${imageBase64}`;
}

/**
 * Hàm setBinsData
 * Nhận dữ liệu JSON về các bin, parse và vẽ lên layout.
 * @param {string} JsonData - Chuỗi JSON chứa thông tin các bin.
 */
function setBinsData(JsonData) {
    try {
        bins = JSON.parse(JsonData);
        console.log("Parsed JSON:", bins);
        drawBins();
    } catch (e) {
        console.error("Invalid JSON:", e);
    }
}

/**
 * Hàm drawBins
 * Xóa nội dung body, tạo container, canvas, tooltip và vẽ lại toàn bộ layout cùng các bin.
 */
function drawBins() {
    document.body.innerHTML = "";

    const container = createScrollableContainer();
    const canvas = createCanvas();
    const ctx = canvas.getContext("2d");
    const tooltip = createTooltip();

    backgroundImage.onload = function () {
        // Resize canvas to match image
        canvas.width = backgroundImage.width;
        canvas.height = backgroundImage.height;

        // Draw background image
        ctx.drawImage(backgroundImage, 0, 0);

        // Draw bins
        binRects = [];
        bins.forEach(bin => drawSingleBin(ctx, bin));

        // Attach hover logic
        setupHoverEvents(canvas, tooltip);
    };

    container.appendChild(canvas);
    document.body.appendChild(container);
}

/**
 * Hàm createScrollableContainer
 * Tạo một div container có scroll để chứa canvas.
 * @returns {HTMLDivElement} - Container div.
 */
function createScrollableContainer() {
    const container = document.createElement("div");
    container.style.width = "100%";
    container.style.height = "100vh";
    container.style.overflow = "auto";
    return container;
}

/**
 * Hàm createCanvas
 * Tạo một thẻ canvas mới.
 * @returns {HTMLCanvasElement} - Canvas element.
 */
function createCanvas() {
    const canvas = document.createElement("canvas");
    canvas.id = "layoutCanvas";
    return canvas;
}

/**
 * Hàm createTooltip
 * Tạo một tooltip hiển thị thông tin khi hover vào bin.
 * @returns {HTMLDivElement} - Tooltip div.
 */
function createTooltip() {
    const tooltip = document.createElement("div");
    tooltip.style.position = "absolute";
    tooltip.style.backgroundColor = "#fff";
    tooltip.style.border = "1px solid #ccc";
    tooltip.style.padding = "4px 8px";
    tooltip.style.borderRadius = "4px";
    tooltip.style.boxShadow = "0 0 5px rgba(0,0,0,0.2)";
    tooltip.style.display = "none";
    tooltip.style.pointerEvents = "none";
    document.body.appendChild(tooltip);
    return tooltip;
}

/**
 * Hàm drawSingleBin
 * Vẽ một bin lên canvas với màu sắc và thông tin tương ứng.
 * @param {CanvasRenderingContext2D} ctx - Context của canvas.
 * @param {Object} item - Thông tin bin.
 */
function drawSingleBin(ctx, item) {
    const { x1, y1, x2, y2, quantity, binCode } = item;
    const width = x2 - x1;
    const height = y2 - y1;

    // Fill bin
    if(x1 == 0 && y1 == 0 && x2 == 0 && y2 == 0){
        return;
    }
    ctx.fillStyle = quantity > 0 ? "#C9C472" : "#E97768"; //có hàng là màu vàng, hết hàng là màu đỏ
    ctx.fillRect(x1, y1, width, height);

    // Border
    ctx.strokeStyle = '#EA9379';
    ctx.lineWidth = 1;
    ctx.strokeRect(x1, y1, width, height);

    // Text
    ctx.fillStyle = "#000";
    ctx.font = "10px Arial";
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";
    ctx.fillText(binCode, x1 + width / 2, y1 + height / 2);

    // Save for hover
    binRects.push({ x: x1, y: y1, width, height, bin: item });
}

/**
 * Hàm setupHoverEvents
 * Thiết lập sự kiện hover để hiển thị tooltip khi di chuột qua các bin.
 * @param {HTMLCanvasElement} canvas - Canvas chứa layout.
 * @param {HTMLDivElement} tooltip - Tooltip để hiển thị thông tin bin.
 */
function setupHoverEvents(canvas, tooltip) {
    canvas.addEventListener("mousemove", (e) => {
        const rect = canvas.getBoundingClientRect();
        const mouseX = e.clientX - rect.left;
        const mouseY = e.clientY - rect.top;

        const blockMovements = new Map([
            [0, ""],
            [1, "InBound"],
            [2, "OutBound"],
            [3, "All"]
        ]);

        let found = false;
        for (let r of binRects) {
            if (
                mouseX >= r.x &&
                mouseX <= r.x + r.width &&
                mouseY >= r.y &&
                mouseY <= r.y + r.height
            ) {
                tooltip.style.display = "block";
                tooltip.style.left = `${e.pageX + 10}px`;
                tooltip.style.top = `${e.pageY + 10}px`;
                tooltip.innerHTML = `
                                        <strong>Bin Code:</strong> ${r.bin.binCode}<br>
                                        <strong>Quantity:</strong> ${r.bin.quantity}<br>
                                        <strong>Item No:</strong> ${r.bin.itemNo}<br>
                                        <strong>Item Description:</strong> ${r.bin.itemDescription}<br>
                                        <strong>Block Movement:</strong> ${blockMovements.get(r.bin.blockMovement)}<br>
                                        <strong>Position:</strong> (${r.x}, ${r.y})
                                    `;
                found = true;
                break;
            }
        }

        if (!found) tooltip.style.display = "none";
    });

    canvas.addEventListener("mouseleave", () => {
        tooltip.style.display = "none";
    });
}
