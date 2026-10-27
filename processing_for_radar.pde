
import processing.serial.*;

Serial myPort;

String data = "";
int iAngle = 90;
int iDistance = -1;

float pixsDistance;
final int maxDistance = 40;

void setup() {
  size(1200, 700);
  smooth();

  // Arduino connection
  myPort = new Serial(this, "COM4", 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  // Fading background effect
  noStroke();
  fill(0, 25);
  rect(0, 0, width, height);

  drawRadar();
  drawObject();
  drawLine();
  drawText();
}

void serialEvent(Serial p) {
  String received = p.readStringUntil('\n');

  if (received == null) return;

  received = trim(received);
  String[] values = split(received, ',');

  if (values.length == 2) {
    try {
      int newAngle = int(trim(values[0]));
      int newDistance = int(trim(values[1]));

      if (newAngle >= 0 && newAngle <= 180) {
        iAngle = newAngle;
        iDistance = newDistance;
      }
    } catch (Exception e) {
      // Ignore invalid serial readings
    }
  }
}

void drawRadar() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);

  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);

  float r1 = width * 0.9375;
  float r2 = width * 0.73;
  float r3 = width * 0.521;
  float r4 = width * 0.313;

  arc(0, 0, r1, r1, PI, TWO_PI);
  arc(0, 0, r2, r2, PI, TWO_PI);
  arc(0, 0, r3, r3, PI, TWO_PI);
  arc(0, 0, r4, r4, PI, TWO_PI);

  // Angle guide lines
  for (int a = 0; a <= 180; a += 30) {
    float x = (width / 2.0) * cos(radians(a));
    float y = -(width / 2.0) * sin(radians(a));
    line(0, 0, x, y);
  }

  popMatrix();
}

void drawObject() {
  if (iDistance < 2 || iDistance > maxDistance) return;

  pushMatrix();
  translate(width / 2, height - height * 0.074);

  strokeWeight(9);
  stroke(255, 10, 10);

  // Convert measured distance into screen pixels
  float maxPixels = height - height * 0.1666;
  pixsDistance = iDistance * (maxPixels / maxDistance);

  // Draw a red line from the detected distance
  // outward to the 40 cm range boundary
  float x1 = pixsDistance * cos(radians(iAngle));
  float y1 = -pixsDistance * sin(radians(iAngle));

  float x2 = maxPixels * cos(radians(iAngle));
  float y2 = -maxPixels * sin(radians(iAngle));

  line(x1, y1, x2, y2);

  popMatrix();
}

void drawLine() {
  pushMatrix();

  translate(width / 2, height - height * 0.074);

  strokeWeight(4);
  stroke(30, 250, 60);

  float radarLength = height - height * 0.12;

  line(
    0, 0,
    radarLength * cos(radians(iAngle)),
    -radarLength * sin(radians(iAngle))
  );

  popMatrix();
}

void drawText() {
  fill(0);
  noStroke();
  rect(0, height - 50, width, 50);

  fill(98, 245, 31);
  textSize(24);

  // Range labels
  text("10 cm", width * 0.60, height - 55);
  text("20 cm", width * 0.70, height - 55);
  text("30 cm", width * 0.80, height - 55);
  text("40 cm", width * 0.90, height - 55);

  textSize(30);
  text("ARDUINO RADAR", 30, 40);

  textSize(24);
  text("Angle: " + iAngle + " deg", width * 0.40, height - 18);

  if (iDistance < 0) {
    text("Distance: No echo", width * 0.65, height - 18);
  } else {
    text("Distance: " + iDistance + " cm",
         width * 0.65, height - 18);
  }

  textSize(20);
  text("Maximum range: 40 cm", 30, 75);
}
