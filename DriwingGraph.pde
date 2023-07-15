/***********************************************************
 *
 *  MQTT - отрисовка графика
 *  20230707 - 20230711
 *  v.011
 *
 ***********************************************************/
//import PImage.*;
//PImage icon = loadImage("myicon.png");
//surface.setIcon(icon);

String filePath;
boolean flagWork = false;
int millisOld = 0;
int rowCount = 0;
String[] lines;
int chas = 0;
int min = 0;
int sec =0;
int chasOld = 0;
int minOld = 0;
int secOld = 0;

float data = 0;
float[] dataData = new float[0];
float[] dataTime = new float[0];
float dataTimeOld = 0;
float dataDataOld = 0;

int w = 1900;
int h = 1000;

float dataMin = 1000;
float dataMax = 0;
float koeff = 0;
float raznicaData = 0;
float a = 0;
float b = 0;
int shift = 0;
float shiftTime = w / 41.77;

int setGraf = 5;
int setLine = 5;

/***********************************************************/
//  настройки

void settings() {
  size(w, h + 200);
  smooth(8);
}

/***********************************************************/
void setup() {

  surface.setLocation(900, 100);
  surface.setTitle("TEST WINDOW !");
  surface.setResizable(true);
  textFont(createFont("Arial", 12, true));

  //driwRect();
  //loadFile();
  //driwData();

  selectInput("Select a file to process:", "fileSelected");
}

/***********************************************************/
void draw() {
  if (flagWork) {
    if (millis() >= millisOld + 1000) {
      driwRect();
      loadFile();
      driwData();
    }
  }
}

/***********************************************************/
