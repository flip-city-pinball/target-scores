// poster-export.jsx

function formatScore(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function formatRow(score) {
    return formatScore(parseInt(score));
}

var scriptFolder = File($.fileName).parent;
var csvFile = new File(scriptFolder + "/posters.csv");
var outputFolder = new Folder(scriptFolder + "/output");

if (!outputFolder.exists) outputFolder.create();

csvFile.open("r");
var lines = [];
while (!csvFile.eof) {
    lines.push(csvFile.readln());
}
csvFile.close();

var doc = app.activeDocument;
var originalUnit = app.preferences.rulerUnits;
app.preferences.rulerUnits = Units.POINTS;

for (var i = 1; i < lines.length; i++) {
    if (lines[i] == "") continue;

    var cols = lines[i].split(",");
    var gameName = cols[0];
    var scores = [];

    for (var r = 0; r < 10; r++) {
        scores.push(formatRow(cols[r + 1]));
    }

    doc.layers.getByName("game_name").textItem.contents = gameName;
    doc.layers.getByName("game_scores").textItem.contents = scores.join("\r");

    var pdfFile = new File(outputFolder + "/" + gameName + ".pdf");
    var pdfOptions = new PDFSaveOptions();
    pdfOptions.compatibility = PDFCompatibility.PDF15;
    pdfOptions.encoding = PDFEncoding.PDFZIP;

    doc.saveAs(pdfFile, pdfOptions, true);
}

app.preferences.rulerUnits = originalUnit;
alert("Done! " + (lines.length - 1) + " posters exported to " + outputFolder.fsName);