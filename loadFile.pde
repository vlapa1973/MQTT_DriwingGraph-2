/***********************************************************/
//  выбор файла
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    filePath = selection.getAbsolutePath();
    flagWork = true;
  }
}

/***********************************************************/
//  загрузка новых данных из файла

void loadFile() {

  lines = loadStrings(filePath);
  if (rowCount == lines.length) {
    return;
  } else {

    for (int i = rowCount; i < lines.length; i++) {
      sec = int(lines[i].substring(6, 8));
      min = int(lines[i].substring(3, 5));
      chas = int(lines[i].substring(0, 2));
      data = float(lines[i].substring(9, lines[i].length()));

      if (dataMin > data) {
        dataMin = data;
      }
      if (dataMax < data) {
        dataMax = data;
      }

      dataData = append(dataData, data);
      dataTime = append(dataTime, chas * 3600 + min * 60 + sec);

      if (a > h / setGraf || b > h / setGraf) {
        a = h / setGraf;
        b = a;
      }

      //line((dataTimeOld / shiftTime + shift), a, (dataTime[i] / shiftTime + shift), b);
    }
    rowCount = lines.length;
  }
  println(dataData.length + ": " +  dataMax + " - " + dataMin + " = " + (dataMax - dataMin));
}

/***********************************************************/
