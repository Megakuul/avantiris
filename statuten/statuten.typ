// Statuten des Vereins Avantiris
// PDF erzeugen:  npm run statuten   (schreibt static/Statuten_Avantiris.pdf)

#set document(title: "Statuten des Vereins Avantiris")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, top: 2.2cm, bottom: 2.6cm),
  footer: context align(center, text(size: 8pt)[
    Statuten des Vereins Avantiris – Seite #counter(page).display()
  ]),
)
#set text(font: "Jost*", size: 10pt, lang: "de", region: "CH", hyphenate: false)
#set par(justify: true, leading: 0.55em, spacing: 0.8em)
#set smartquote(enabled: false)
#show enum: set par(justify: false)
#set enum(numbering: "a)", indent: 1.2em, body-indent: 0.8em, spacing: 0.55em)

// Abschnitt (I., II., …): Linie darüber, etwas grösser
#show heading.where(level: 1): it => block(above: 1.8em, below: 0.9em, sticky: true)[
  #line(length: 100%, stroke: 1pt)
  #v(-0.3em)
  #text(size: 11.5pt, weight: "bold", it.body)
]
// Artikel
#show heading.where(level: 2): it => block(above: 1.3em, below: 0.7em, sticky: true,
  text(size: 10pt, weight: "bold", it.body))

// ---------------------------------------------------------------- Kopf
#align(center)[
  #box(baseline: 22%, image("logo.svg", height: 22pt))
  #h(8pt)
  #text(weight: "bold", size: 21pt, tracking: 2pt)[AVANTIRIS]
  #v(-0.55em)
  #text(size: 7pt, weight: "bold", tracking: 1.2pt, fill: luma(90))[THINK TANK FÜR KI UND GESELLSCHAFT]
]
#v(2.2em)

#align(center)[
  #text(size: 20pt, weight: "bold")[Statuten]
  #v(-1.0em)
  #text(size: 12pt, weight: "bold")[des Vereins Avantiris]
]
#v(0.6em)

// ---------------------------------------------------------------- Text
= I. Name, Sitz und Zweck

== Art. 1 – Name und Sitz

¹ Unter dem Namen «Avantiris» besteht ein Verein im Sinne von Art. 60 ff. des Schweizerischen Zivilgesetzbuches (ZGB) mit Sitz in Thun. Er tritt mit dem Zusatz «Think Tank für KI und Gesellschaft» auf.

² Der Verein ist parteipolitisch und konfessionell neutral und unabhängig.

== Art. 2 – Zweck

¹ Der Verein fördert das Verständnis der langfristigen gesellschaftlichen, wirtschaftlichen und ethischen Auswirkungen künstlicher Intelligenz, insbesondere von neuronalen Netzen, grossen Sprachmodellen und Robotik, sowie die sachliche öffentliche Auseinandersetzung damit.

² Er verfolgt diesen Zweck insbesondere durch:

+ die Erarbeitung und Veröffentlichung von Analysen, Studien und Lösungsansätzen;
+ die Durchführung von Veranstaltungen, Vorträgen, Kursen und anderen Bildungsangeboten;
+ die Information der Öffentlichkeit sowie den Dialog mit Bevölkerung, Bildung, Wissenschaft, Wirtschaft, Politik und Behörden;
+ die Zusammenarbeit mit Organisationen, die ähnliche Zwecke verfolgen;
+ sachliche, parteipolitisch unabhängige Stellungnahmen, insbesondere in Vernehmlassungsverfahren, sowie Grundlagen- und Positionspapiere (Policy Papers) zu Fragen der künstlichen Intelligenz.

³ Der Verein verfolgt ausschliesslich gemeinnützige Zwecke im Allgemeininteresse. Er ist uneigennützig tätig und strebt keinen Gewinn an.

⁴ Der Verein kann alle Tätigkeiten ausüben, die diesem Zweck dienen.

⁵ Seine Stellungnahmen beruhen auf fachlichen Grundlagen und dienen dem Zweck nach Absatz 1; sie bleiben der Bildungs- und Informationstätigkeit untergeordnet. Der Verein unterstützt weder politische Parteien noch Kandidierende noch Wahl- oder Abstimmungskampagnen.

= II. Mittel

== Art. 3 – Mittel und Mittelverwendung

¹ Der Verein finanziert sich durch Mitgliederbeiträge, Spenden, Legate und andere Zuwendungen, Beiträge der öffentlichen Hand und Dritter sowie Erträge aus seiner Tätigkeit und seinem Vermögen.

² Seine Mittel sind ausschliesslich und unwiderruflich dem Vereinszweck gewidmet. Gewinne werden nicht ausgeschüttet. Die Mitglieder haben keinen Anspruch auf das Vereinsvermögen.

³ Der Verein nimmt nur Zuwendungen an, die seine inhaltliche Unabhängigkeit nicht beeinträchtigen. Zuwendungen juristischer Personen von mehr als CHF 5'000 pro Jahr werden im Jahresbericht unter Angabe der zuwendenden Organisation offengelegt.

== Art. 4 – Haftung

Für die Verbindlichkeiten des Vereins haftet ausschliesslich das Vereinsvermögen. Eine persönliche Haftung oder Nachschusspflicht der Mitglieder ist ausgeschlossen.

= III. Mitgliedschaft

== Art. 5 – Mitglieder

¹ Mitglied kann jede natürliche oder juristische Person werden, die den Vereinszweck unterstützt.

² Der Verein kennt folgende Mitgliederkategorien:

+ Aktivmitglieder: natürliche Personen mit vollem Stimm- und Wahlrecht;
+ Fördermitglieder: natürliche oder juristische Personen, die den Verein finanziell unterstützen; sie haben beratende Stimme, aber kein Stimm- und Wahlrecht;
+ Ehrenmitglieder: Personen, die sich um den Verein besonders verdient gemacht haben; sie werden von der Mitgliederversammlung auf Antrag des Vorstands ernannt, haben volles Stimm- und Wahlrecht und sind von Beiträgen befreit.

³ Aufnahmegesuche sind schriftlich an den Vorstand zu richten. Der Vorstand entscheidet über die Aufnahme. Er kann ein Gesuch ohne Angabe von Gründen ablehnen.

== Art. 6 – Erlöschen der Mitgliedschaft

¹ Die Mitgliedschaft erlischt durch Austritt, Ausschluss, Tod oder bei juristischen Personen durch deren Auflösung.

² Der Austritt ist jederzeit durch schriftliche Erklärung an den Vorstand möglich; E-Mail genügt. Der Beitrag für das laufende Geschäftsjahr bleibt geschuldet.

³ Der Vorstand kann ein Mitglied aus wichtigen Gründen ausschliessen, insbesondere wenn es dem Vereinszweck oder dem Ansehen des Vereins zuwiderhandelt oder seinen Beitrag trotz Mahnung nicht bezahlt. Der Entscheid ist schriftlich mitzuteilen. Das betroffene Mitglied kann innert 30 Tagen nach Erhalt des Entscheids schriftlich an die nächste Mitgliederversammlung rekurrieren, die endgültig entscheidet. Bis dahin ruhen die Mitgliedschaftsrechte.

⁴ Ausscheidende Mitglieder haben keinen Anspruch auf das Vereinsvermögen.

== Art. 7 – Mitgliederbeiträge

¹ Die Mitgliederversammlung legt die Jahresbeiträge für die einzelnen Kategorien fest. Für natürliche Personen beträgt der Jahresbeitrag höchstens CHF 200.

² Der Vorstand kann Beiträge in begründeten Fällen ermässigen oder erlassen.

= IV. Organisation

== Art. 8 – Organe

Die Organe des Vereins sind:

+ die Mitgliederversammlung;
+ der Vorstand;
+ die Rechnungsrevision.

== Art. 9 – Mitgliederversammlung: Einberufung

¹ Die Mitgliederversammlung ist das oberste Organ des Vereins.

² Die ordentliche Mitgliederversammlung findet jährlich innerhalb von sechs Monaten nach Abschluss des Geschäftsjahres statt.

³ Eine ausserordentliche Mitgliederversammlung findet statt, wenn der Vorstand dies beschliesst oder ein Fünftel der stimmberechtigten Mitglieder es unter Angabe der Traktanden schriftlich verlangt. Im zweiten Fall findet sie innert 60 Tagen statt.

⁴ Der Vorstand lädt mindestens 14 Tage im Voraus schriftlich mit Traktandenliste ein; E-Mail an die zuletzt bekannte Adresse genügt.

⁵ Anträge der Mitglieder sind bis spätestens 7 Tage vor der Versammlung schriftlich beim Vorstand einzureichen. Über nicht traktandierte Geschäfte kann nicht beschlossen werden; ausgenommen ist der Antrag auf Einberufung einer ausserordentlichen Versammlung.

⁶ Die Versammlung kann physisch, virtuell oder in gemischter Form stattfinden. Bei virtueller Teilnahme stellt der Vorstand sicher, dass die Teilnehmenden identifiziert werden können, sich äussern können und die Stimmabgabe zuverlässig erfasst wird.

== Art. 10 – Mitgliederversammlung: Befugnisse

Die Mitgliederversammlung hat folgende Befugnisse:

+ Wahl und Abberufung des Präsidiums oder Co-Präsidiums, der übrigen Vorstandsmitglieder und der Rechnungsrevision;
+ Genehmigung von Jahresbericht und Jahresrechnung und Entlastung des Vorstands;
+ Kenntnisnahme vom Budget und Festlegung der Mitgliederbeiträge;
+ Ernennung von Ehrenmitgliedern;
+ Entscheid über Rekurse gegen Ausschlüsse;
+ Änderung der Statuten;
+ Beschluss über Fusion und Auflösung des Vereins und über die Verwendung des Liquidationserlöses;
+ alle Geschäfte, die ihr durch Gesetz oder Statuten vorbehalten sind oder die ihr der Vorstand vorlegt.

== Art. 11 – Mitgliederversammlung: Beschlüsse und Wahlen

¹ Jede ordnungsgemäss einberufene Mitgliederversammlung ist ohne Rücksicht auf die Zahl der Anwesenden beschlussfähig.

² Jedes stimmberechtigte Mitglied hat eine Stimme. Eine Vertretung ist nicht zulässig. Mitglieder treten bei Beschlüssen über ein Rechtsgeschäft oder einen Rechtsstreit zwischen ihnen selbst und dem Verein in den Ausstand (Art. 68 ZGB).

³ Die Mitgliederversammlung fasst ihre Beschlüsse mit der Mehrheit der abgegebenen Stimmen; Enthaltungen und leere Stimmen zählen nicht. Bei Stimmengleichheit entscheidet bei Sachgeschäften die Person, welche die Versammlung leitet.

⁴ Bei Wahlen gilt im ersten Wahlgang das absolute, im zweiten das relative Mehr. Bei Stimmengleichheit entscheidet das Los.

⁵ Statutenänderungen, Fusion und Auflösung erfordern zwei Drittel der abgegebenen Stimmen. Eine Umwandlung des Vereinszwecks kann keinem Mitglied aufgenötigt werden (Art. 74 ZGB).

⁶ Abgestimmt wird offen, sofern nicht ein Drittel der anwesenden Stimmberechtigten eine geheime Abstimmung verlangt.

⁷ Über die Beschlüsse wird ein Protokoll geführt, das den Mitgliedern zugänglich gemacht wird.

== Art. 12 – Urabstimmung

¹ Der Vorstand kann Beschlüsse und Wahlen der Mitgliederversammlung auf schriftlichem oder elektronischem Weg durchführen (Urabstimmung), sofern nicht ein Fünftel der stimmberechtigten Mitglieder innert 7 Tagen nach Zustellung der Unterlagen die Durchführung einer Versammlung verlangt.

² Die Frist zur Stimmabgabe beträgt mindestens 14 Tage. Es gelten die Mehrheiten von Art. 11. Das Ergebnis wird den Mitgliedern schriftlich mitgeteilt.

== Art. 13 – Vorstand: Zusammensetzung

¹ Der Vorstand besteht aus mindestens zwei Mitgliedern. Die Mitgliederversammlung wählt das Präsidium; es kann als Co-Präsidium von zwei Personen geführt werden. Im Übrigen konstituiert sich der Vorstand selbst.

² Die Amtsdauer beträgt zwei Jahre. Wiederwahl ist zulässig. Scheidet ein Mitglied während der Amtsdauer aus, kann der Vorstand bis zur nächsten Mitgliederversammlung eine Person kooptieren.

== Art. 14 – Vorstand: Aufgaben und Beschlüsse

¹ Der Vorstand leitet den Verein und ist für alle Geschäfte zuständig, die nicht durch Gesetz oder Statuten einem anderen Organ vorbehalten sind. Er führt die Buchhaltung, erstellt Jahresbericht, Jahresrechnung und Budget und vollzieht die Beschlüsse der Mitgliederversammlung.

² Der Vorstand ist beschlussfähig, wenn die Mehrheit seiner Mitglieder anwesend ist. Er beschliesst mit der Mehrheit der Stimmen; bei Stimmengleichheit gibt das Präsidium den Stichentscheid; bei einem Co-Präsidium gilt der Antrag als abgelehnt. Beschlüsse können auch auf schriftlichem oder elektronischem Weg gefasst werden, sofern kein Mitglied eine Sitzung verlangt.

³ Vorstandsmitglieder treten bei Geschäften, die ihre eigenen Interessen oder jene ihnen nahestehender Personen oder Organisationen berühren, in den Ausstand.

⁴ Der Vorstand kann Arbeitsgruppen und einen Fachbeirat ohne Organstellung einsetzen sowie eine Geschäftsstelle führen oder Aufgaben an Dritte übertragen.

== Art. 15 – Vertretung und Zeichnungsberechtigung

Der Verein wird durch die Kollektivunterschrift zu zweien von Mitgliedern des Vorstands verpflichtet. Der Vorstand kann für Geschäfte des laufenden Betriebs bis zu einem von ihm festgelegten Betrag Einzelunterschrift erteilen.

== Art. 16 – Entschädigung

¹ Die Mitglieder des Vorstands sind grundsätzlich ehrenamtlich tätig. Sie haben Anspruch auf Ersatz ihrer effektiven Auslagen.

² Für Leistungen, die über das übliche Mass der Vorstandstätigkeit hinausgehen, kann eine angemessene Entschädigung ausgerichtet werden. Der Vorstand weist die Entschädigungen in der Jahresrechnung aus.

== Art. 17 – Rechnungsrevision

¹ Die Mitgliederversammlung wählt für zwei Jahre eine Person oder eine Revisionsstelle für die Rechnungsrevision. Wiederwahl ist zulässig. Die Rechnungsrevision darf nicht dem Vorstand angehören und muss nicht Mitglied des Vereins sein.

² Die Rechnungsrevision prüft die Jahresrechnung und erstattet der Mitgliederversammlung schriftlich Bericht und Antrag.

³ Vorbehalten bleiben die gesetzlichen Bestimmungen über die Revisionspflicht (Art. 69b ZGB).

= V. Schlussbestimmungen

== Art. 18 – Geschäftsjahr

Das Geschäftsjahr entspricht dem Kalenderjahr. Das erste Geschäftsjahr beginnt mit der Gründung und kann bis zum 31. Dezember des folgenden Jahres dauern.

== Art. 19 – Auflösung und Fusion

¹ Die Auflösung des Vereins kann nur an einer Mitgliederversammlung beschlossen werden, die zu diesem Zweck einberufen wurde. Die Liquidation erfolgt durch den Vorstand, sofern die Mitgliederversammlung nichts anderes beschliesst.

² Bei einer Auflösung fällt das verbleibende Vereinsvermögen an eine juristische Person mit Sitz in der Schweiz, die wegen Gemeinnützigkeit oder öffentlicher Zweckverfolgung von der Steuerpflicht befreit ist und einen gleichen oder ähnlichen Zweck verfolgt. Die Mitgliederversammlung bestimmt die empfangende Organisation. Eine Verteilung an die Mitglieder ist ausgeschlossen.

³ Eine Fusion ist nur mit einer juristischen Person nach Absatz 2 zulässig.

== Art. 20 – Inkrafttreten

// Leere Linie zum Ausfüllen von Hand
#let blank(width) = box(width: width, stroke: (bottom: 0.6pt), outset: (bottom: 2pt))

#block(breakable: false)[
  Diese Statuten wurden an der Gründungsversammlung vom #blank(3.2cm) in Thun angenommen und treten sofort in Kraft.

  #v(1.5em)
  Thun, #blank(3.2cm)

  #v(4em)
  #set par(justify: false)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5cm,
    row-gutter: 0.9em,
    line(length: 100%, stroke: 0.6pt), line(length: 100%, stroke: 0.6pt),
    [Co-Präsidium], [Co-Präsidium und Protokoll],
    [Vorname, Name: #blank(3.2cm)], [Vorname, Name: #blank(3.2cm)],
  )
]
