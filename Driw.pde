/***********************************************************/
//  отрисовка графиков

void driwRect() {
  textSize(30 / setGraf * 1.7);
  for (int i = 0; i < setGraf; ++i) {
    stroke(0);
    rect(0, (h / setGraf * i), w, (h / setGraf * (i + 1)));
  }

  for (int k = 0; k < setGraf; ++k) {
    for (int j = 1; j < setLine; ++j) {
      stroke(200);
      line(0, h / setGraf / setLine * j + h / setGraf * k, w, h / setGraf / setLine * j + h / setGraf * k);
      fill(0);
    }
    for (int j = 0; j < 24; ++j) {
      fill(0);
      stroke(200);
      line(1 + w / 24 * j, h / setGraf * (k + 1), 1 + w / 24 * j, h / setGraf * (k + 1) - h / setGraf);
      line(1 + w / 24 * j + w / 24 / 2, h / setGraf * (k + 1), 1 + w / 24 * j + w / 24 / 2, h / setGraf * (k + 1) - h / setGraf);

      stroke(0);
      line(1 + w / 24 * j, h / setGraf * (k + 1), 1 + w / 24 * j, h / setGraf * (k + 1) - 15);
      text(j, 6 + w / 24 * j, h / setGraf * (k + 1) - 4);
      line(w / 24 / 2 + 1 + w / 24 * j, h / setGraf * (k + 1), w / 24 / 2 + 1 + w / 24 * j, h / setGraf * (k + 1) - 5);
    }
  }
  fill(255);
}

/***********************************************************/
//  первичная отрисовка данных

void driwData() {
  raznicaData = dataMax - dataMin;
  koeff = h / setGraf / (raznicaData / setLine * 2 + raznicaData);

  driwRect();

  stroke(255, 0, 0);
  strokeWeight(1);

  for (int i = 0; i < dataData.length; ++i) {
    a = h / setGraf - (dataDataOld - dataMin + raznicaData / setLine) * koeff;
    b = h / setGraf - (dataData[i] - dataMin + raznicaData / setLine) * koeff;

    if (a > h / setGraf || b > h / setGraf) {
      a = h / setGraf;
      b = h / setGraf;
    }

    line((dataTimeOld / shiftTime + shift), a, (dataTime[i] / shiftTime + shift), b);

    dataTimeOld = dataTime[i];
    dataDataOld = dataData[i];
  }
  dataTimeOld = 0;
  dataDataOld = 0;

  String[] razm = new String[setLine];
  String dt = "";
  dt += dataMin;
  razm[1] = dt.substring(0, dt.indexOf('.') + 2);
  dt = "";
  dt += dataMax;
  razm[setLine - 1] = dt.substring(0, dt.indexOf('.') + 2);
  dt = "";
  for (int s = 2; s < setLine - 1; ++s) {
    dt += raznicaData / (setLine - 2) * (s - 1) + dataMin;
    razm[s] = dt.substring(0, dt.indexOf('.') + 2);
    dt = "";
  }
  
  println(dataMin + "; " + dataMax);
  for (int a = 0; a < setLine; ++a){
    print(razm[a] + "-");
  }
  println();

  for (int l = 0; l < setGraf; ++l) {
    for (int k = 0; k < setLine - 1; ++k) {
      fill(0);
      text(razm[setLine - k - 1], 3, (h / setGraf / setLine * (k + 1)) + (h / setGraf * l) - 3);
      text(razm[setLine - k - 1], w - (6 - setGraf) * 40, (h / setGraf / setLine * (k + 1)) + (h / setGraf * l) - 3);
    }
  }
  fill(255);
}

/***********************************************************/
