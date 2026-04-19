FloatTable data;
int rowCount;
int columnCount;
float dataMin, dataMax;
String[] months;
int currentDataset = 0; // 0: LA 2023, 1: NY 2023, 2: LA 2024, 3: NY 2024
boolean isBarGraph = true;
boolean showVerticalLines = false;
float zoomLevel = 1.0;
float minZoom = 0.5;
float maxZoom = 2.0;
Integrator[] integrators;
int plotX1, plotY1, plotX2, plotY2;
float[] tabLeft, tabRight;
float tabTop, tabBottom;
float tabPad = 10;
String[] datasetNames = {"Los Angeles", "New York"};
String[] dataFiles = {
  "data/aqi_los_angeles_2023.csv",
  "data/aqi_new_york_2023.csv",
  "data/aqi_los_angeles_2024.csv",
  "data/aqi_new_york_2024.csv"
};

void setup() {
  size(800, 600);
  plotX1 = 80;
  plotY1 = 80;
  plotX2 = width - 80;
  plotY2 = height - 80;
  println("Loading dataset 0...");
  loadDataset(0);
  println("Dataset loaded. Rows: " + rowCount + ", Columns: " + columnCount);
  integrators = new Integrator[rowCount];
  initializeIntegrators();
}

void initializeIntegrators() {
  println("Initializing integrators...");
  for (int row = 0; row < rowCount; row++) {
    float initialValue = data.getFloat(row, 0);
    integrators[row] = new Integrator(initialValue, 0.2, 0.05);
  }
  println("Integrators initialized.");
}

void loadDataset(int dataset) {
  println("Checking file: " + dataFiles[dataset]);
  String[] test = loadStrings(dataFiles[dataset]);
  if (test == null) {
    println("File load failed.");
  } else {
    println("File loaded. Lines: " + test.length);
  }
  data = new FloatTable(dataFiles[dataset]);
  println("Loading " + dataFiles[dataset]);
  data = new FloatTable(dataFiles[dataset]);
  if (data == null || data.getRowCount() == 0) {
    println("Error: Failed to load " + dataFiles[dataset]);
    exit();
  }
  rowCount = data.getRowCount();
  columnCount = data.getColumnCount();
  dataMin = data.getTableMin();
  dataMax = data.getTableMax();
  months = data.getRowNames();
  currentDataset = dataset;
  if (integrators != null && integrators.length == rowCount) {
    for (int row = 0; row < rowCount; row++) {
      integrators[row].target(data.getFloat(row, 0));
    }
  }
}

void draw() {
  background(255);
  for (int row = 0; row < rowCount; row++) {
    integrators[row].update();
  }

  // Draw plot window
  fill(255);
  rect(plotX1, plotY1, plotX2, plotY2);

  // Draw title, axes, tick marks, tabs, legend
  drawTitle();
  drawAxes();
  drawXTickMarks();
  drawYTickMarks();
  drawTitleTabs();
  drawLegend();

  // Draw graph
  if (isBarGraph) {
    drawBarGraph();
  } else {
    drawLineGraph();
  }

  // Instructions
  textAlign(LEFT, TOP);
  textSize(10);
  fill(0);
  text("Press 'b' for Bar, 'l' for Line, '1'/'2' for cities, 'v' for vertical lines", 10, 10);
}

void drawTitle() {
  textAlign(CENTER, TOP);
  textSize(16);
  fill(0);
  String title = "Monthly AQI - " + datasetNames[currentDataset % 2] + " " + (currentDataset < 2 ? "2023" : "2024");
  text(title, plotX1 + (plotX2 - plotX1) / 2, plotY1 - 35);
}

void drawAxes() {
  stroke(0);
  strokeWeight(2);
  line(plotX1, plotY2, plotX2, plotY2); // X-axis
  line(plotX1, plotY2, plotX1, plotY1); // Y-axis

  // Axis labels
  textSize(12);
  textAlign(CENTER, BOTTOM);
  text("Month", plotX1 + (plotX2 - plotX1) / 2, plotY2 + 40);
  textAlign(CENTER, CENTER);
  pushMatrix();
  translate(plotX1 - 40, plotY1 + (plotY2 - plotY1) / 2);
  rotate(-PI / 2);
  text("AQI", 0, 0);
  popMatrix();
}

void drawXTickMarks() {
  textSize(12);
  textAlign(CENTER, TOP);
  stroke(0);
  strokeWeight(1);
  float xStep = (plotX2 - plotX1) / (rowCount - 1);
  for (int row = 0; row < rowCount; row++) {
    float x = plotX1 + row * xStep;
    line(x, plotY2, x, plotY2 + 5);
    text(months[row], x, plotY2 + 10);
    if (showVerticalLines) {
      stroke(200);
      line(x, plotY2, x, plotY1);
      stroke(0);
    }
  }
}

void drawYTickMarks() {
  textSize(12);
  textAlign(RIGHT, CENTER);
  stroke(0);
  strokeWeight(1);
  float aqiRange = (dataMax + 10) - (dataMin - 10);
  float interval = aqiRange / 5;
  for (float aqi = floor(dataMin - 10); aqi <= ceil(dataMax + 10); aqi += interval) {
    float y = map(aqi, dataMin - 10, dataMax + 10, plotY2, plotY1);
    if (y >= plotY1 && y <= plotY2) {
      line(plotX1 - 5, y, plotX1, y);
      text(nf(aqi, 1, 0), plotX1 - 10, y);
    }
  }
}

void drawBarGraph() {
  noStroke();
  float xStep = (plotX2 - plotX1) / (rowCount - 1);
  float barWidth = xStep * 0.4;
  for (int row = 0; row < rowCount; row++) {
    float value = integrators[row].value;
    float x = plotX1 + row * xStep;
    float y = map(value, dataMin - 10, dataMax + 10, plotY2, plotY1);
    float h = plotY2 - y;
    if (value < 50) fill(0, 255, 0); // Good
    else if (value <= 100) fill(255, 255, 0); // Moderate
    else fill(255, 0, 0); // Unhealthy
    rect(x - barWidth / 2, y, x + barWidth / 2, y + h);
    if (mouseX >= x - barWidth / 2 && mouseX <= x + barWidth / 2 && mouseY >= y && mouseY <= y + h) {
      fill(0);
      textAlign(CENTER, BOTTOM);
      text(nf(value, 1, 0), x, y - 5);
    }
  }
}

void drawLineGraph() {
  noFill();
  stroke(0, 0, 255);
  strokeWeight(2);
  beginShape();
  float xStep = (plotX2 - plotX1) / (rowCount - 1);
  for (int row = 0; row < rowCount; row++) {
    float value = integrators[row].value;
    float x = plotX1 + row * xStep;
    float y = map(value, dataMin - 10, dataMax + 10, plotY2, plotY1);
    vertex(x, y);
    if (dist(mouseX, mouseY, x, y) < 10) {
      fill(0);
      textAlign(CENTER, BOTTOM);
      text(nf(value, 1, 0), x, y - 5);
      noFill();
    }
  }
  endShape();
}

void drawTitleTabs() {
  rectMode(CORNERS);
  textSize(14);
  textAlign(LEFT);
  if (tabLeft == null) {
    tabLeft = new float[2];
    tabRight = new float[2];
  }
  float runningX = plotX1;
  tabTop = plotY1 - textAscent() - 15;
  tabBottom = plotY1;
  for (int i = 0; i < 2; i++) {
    String title = datasetNames[i];
    tabLeft[i] = runningX;
    float titleWidth = textWidth(title);
    tabRight[i] = tabLeft[i] + tabPad + titleWidth + tabPad;
    fill(i == currentDataset % 2 ? 255 : 200);
    rect(tabLeft[i], tabTop, tabRight[i], tabBottom);
    fill(i == currentDataset % 2 ? 0 : 100);
    text(title, runningX + tabPad, plotY1 - 10);
    runningX = tabRight[i];
  }
}

void drawLegend() {
  textAlign(LEFT, CENTER);
  textSize(12);
  float x = plotX2 - 100;
  float y = plotY1 + 20;
  fill(0, 255, 0);
  rect(x, y - 10, x + 10, y);
  fill(0);
  text("Good (<50)", x + 15, y - 5);
  y += 20;
  fill(255, 255, 0);
  rect(x, y - 10, x + 10, y);
  fill(0);
  text("Moderate (50-100)", x + 15, y - 5);
  y += 20;
  fill(255, 0, 0);
  rect(x, y - 10, x + 10, y);
  fill(0);
  text("Unhealthy (>100)", x + 15, y - 5);
}

void mousePressed() {
  if (mouseY > tabTop && mouseY < tabBottom) {
    for (int i = 0; i < 2; i++) {
      if (mouseX > tabLeft[i] && mouseX < tabRight[i]) {
        loadDataset(i + (currentDataset < 2 ? 0 : 2));
      }
    }
  }
}

void keyPressed() {
  if (key == 'b') isBarGraph = true;
  if (key == 'l') isBarGraph = false;
  if (key == 'v') showVerticalLines = !showVerticalLines;
  if (key == '1') loadDataset(currentDataset < 2 ? 0 : 2); // Los Angeles
  if (key == '2') loadDataset(currentDataset < 2 ? 1 : 3); // New York
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoomLevel += e * -0.1;
  zoomLevel = constrain(zoomLevel, minZoom, maxZoom);
}
