# Changelog

Alle nennenswerten Änderungen an diesem Projekt.
Format nach [Keep a Changelog](https://keepachangelog.com/de/1.0.0/), Versionierung nach SemVer.

## [1.17.0] – 2026-07-29

### Fixed
- **🔴 Sechs von 23 Copy-Buttons lieferten nur ein Bruchstück.** Beim Prüfen der Typografie
  aufgefallen: Ein **gerades** `"` im `data-copy`-Attribut beendet den Attributwert vorzeitig. Der
  Prompt in Modul 2 brach zum Beispiel bei „Kommunikation mit Patienten" ab — der Rest landete als
  ungültiges Markup im Tag. Im Browser fällt das nicht auf, weil die Seite trotzdem rendert und der
  Button vorhanden ist; nur der *kopierte* Text war unvollständig. Betroffen: Modul 2 (von heute,
  v1.9.0), Vertiefung 1 (2×), Aufbau 3, 4 und 5. Alle Attribute aus dem sichtbaren Text
  regeneriert — geprüft, dass Attribut und Text bei allen 23 Prompts jetzt zeichengleich sind.
- **Einfache Anführungszeichen und Apostrophe vervollständigt (7 Stellen).** Nach den doppelten
  waren auch diese halbfertig: 3 öffnende `‚` standen da, aber **null** schließende `‘` — dafür 7
  gerade `'`. Davon waren drei Schließer (`‚Sie’` → `‚Sie‘`) und vier echte Auslassungs-Apostrophe
  („So machen wir’s", „geht’s"), die U+2019 brauchen. Beide Fälle lassen sich sicher unterscheiden:
  nach offenem `‚` ist es ein Schließer, zwischen zwei Buchstaben ein Apostroph.

### Added
- **Modul 8: Challenge-Variante D für Lehrkräfte** (Doppelstunde planen, Handout in einfacher
  Sprache, fachliche Prüfung inkl. „keine erfundenen Normen"). A–C decken Marketing, Verwaltung und
  Bewerbermanagement ab — der Schulbetrieb fehlte, und das wiegt in der Abschlussaufgabe schwerer
  als in den Modulen davor.
- **Konsistenz-Check um zwei Regelgruppen erweitert** (jetzt 10): einfache Anführungszeichen und
  Apostrophe (die erste Fassung prüfte nur die doppelten und übersah 7 Stellen) sowie
  **data-copy-Integrität** — genau der Fehler, den ein Browser-Test nicht sichtbar macht.

### Changed
- **Modul 8: kein Zertifikat-Versprechen mehr.** „Ein Abschluss-Vermerk / Zertifikat kann über das
  Schulungs-Team ausgestellt werden" → „Wenn du einen Vermerk für deine Unterlagen brauchst, sprich
  dein Schulungs-Team an." Der Trainer-Leitfaden führt das als *optional*.

## [1.16.0] – 2026-07-29

### Fixed
- **Ampel-Definition in Modul 7 und im Deck an Modul 1 angeglichen.** Drei Befunde waren
  Folgefehler der eigenen Änderungen von heute: v1.11.0 hatte „interne Dokumente ohne Personenbezug"
  in Modul 1 von Gelb nach **Grün** verschoben — Modul 7 und die Deck-Folie führten sie weiter unter
  Gelb. Damit war dasselbe Material auf drei Seiten unterschiedlich einsortiert, und zwar genau in
  den Modulen, die die Ampel definieren. Beide nachgezogen, dazu der Hinweis auf **indirekte**
  Erkennbarkeit (Herkunft + Ereignis), der bislang nur in Modul 1 stand.
- **Realistische Personendatensätze aus Modul 7 und dem Deck entfernt.** „Frau Santos, geb.
  12.03.1991, … wohnhaft in Essen" → „Maria Musterfrau" (wie in Modul 1 seit v1.10.0), und die
  Quiz-Fälle „Frau Müller, geb. 1988, Diagnose …" beschreiben den Fall jetzt statt einen Datensatz
  vorzuführen („eine E-Mail, in der Name, Geburtsdatum und eine Diagnose stehen") — für ein Quiz
  genauso anschaulich. **Behalten** wurden die Herkunftsangaben in Modul 7 („die Bewerberin aus
  Kolumbien"): dort ist die Herkunft nicht schmückendes Detail, sondern der Lerngegenstand — die
  Beispiele zeigen ja gerade, dass Herkunft + Ereignis eine Person identifizierbar machen.
- **Fünfte Gender-Variante geglättet:** „Datenschutzbeauftragte**:r**" in der Checkliste. Die
  Suche in v1.10.0 hatte nur die `:n`-Form erfasst.

### Changed
- **Modul 7 begründet die Ampel jetzt selbst.** Das Pflichtmodul wiederholte die Regel, ohne den
  Grund zu nennen — der Ausklapper dazu stand nur in Modul 1. Neuer Kurz-Kasten mit dem
  entscheidenden Punkt: Es geht **nicht** ums Training, sondern darum, dass jeder Upload Daten aus
  dem Haus gibt. Mit Anker-Verweis auf die Langfassung.
- **Prompt Injection klingt in Modul 7 und Modul 4 nicht mehr unterschiedlich.** Modul 7 sagte
  „Claude ist darauf trainiert, das zu unterscheiden", Modul 4 (v1.13.0) „die Grenze ist nicht
  trennscharf". Modul 7 ist der Anker, auf den Modul 4 verweist — jetzt gleiche Tonalität, plus
  Rückverweis auf den Agenten-Modus.

## [1.15.0] – 2026-07-29

### Fixed
- **Deutsche Anführungszeichen site-weit vervollständigt: 272 Schließer korrigiert.** Geöffnet wurde
  überall typografisch korrekt mit `„`, geschlossen aber mit dem geraden Zoll-Zeichen `"` statt mit
  `“` — im Fließtext sichtbar schief, weil das öffnende Zeichen gebogen und das schließende senkrecht
  ist. Aufschlussreich war, *wo* es schon stimmte: in den `data-copy`-Attributen der Prompt-Blöcke.
  Dort **musste** der Autor typografische Zeichen nehmen, weil ein gerades `"` das Attribut beendet
  hätte; im Fließtext fehlte dieser Zwang. Beim Geviertstrich-Durchgang am 27.07. war das übersehen
  worden, obwohl der Textqualitäts-Skill die Regel führt.
  Korrigiert per Zustandsautomat, der HTML-Tags sowie `<script>`- und `<style>`-Blöcke ausspart und
  nur ersetzt, wenn davor ein `„` offen ist. Ergebnis: 274 Öffner und 274 Schließer über alle 19
  Seiten, **0 gerade Zeichen** im sichtbaren Text, HTML-Attribute unangetastet (4661 gerade Zeichen
  in Tags unverändert), 0 Fälle ohne zugehörigen Öffner.

### Changed
- **Modul 6: kein Versprechen mehr auf einen Kurs, den es noch nicht gibt.** Statt „für Interessierte
  gibt es einen eigenen, tieferen Aufbaukurs" jetzt „kommen genug Interessierte zusammen, richten wir
  einen ein" — `state/current_state.md` führt ihn ausdrücklich nur als Absicht („ggf.").
- **Modul 6: Beispiel-Datei ist kein Markdown mehr.** `uebersicht.md` ließ sich für die
  ausdrücklich nicht-technische Zielgruppe nicht einmal sinnvoll öffnen; jetzt eine Word-Datei.
- **Modul 6 verweist auf Modul 4.** Die „drei Details" (klarer Ort · neue statt veränderte Datei ·
  Schutzsatz) sind dasselbe Prinzip wie „Wo landet das Ergebnis?" aus v1.13.0 — hier nur konkreter.
  Der Querverweis verbindet beide Stellen statt sie unabhängig nebeneinander zu stellen.

## [1.14.0] – 2026-07-29

### Changed
- **Modul 5 gibt keine Unbedenklichkeits-Erklärung mehr ab.** Der Schluss-Tipp nannte einen Connector
  zu einem Vorlagen-Ordner „datenschutzrechtlich unkritisch" – eine rechtliche Zusage, die eine
  Schulungsseite nicht geben kann, und im Widerspruch zu dem, was Modul 1 seit v1.10.0 sagt („jeder
  Upload gibt Daten aus dem Haus"). Ein Connector ist dabei der weitreichendste Fall, weil er eine
  **ganze Quelle** anbindet statt einer geprüften Datei. Jetzt: „der einfachste Fall, erfahrungsgemäß
  am schnellsten freigegeben" – die Bewertung machen IT und Datenschutz.
- **Skills werden erklärt, statt nur genannt.** Sie stehen im Modultitel, bekamen aber vier Sätze,
  und das Beispiel („aus Daten eine saubere Tabelle bauen") beschrieb etwas, das Claude **ohne** Skill
  kann – der eigentliche Nutzen blieb damit unsichtbar. Jetzt „Skills – festgelegte Arbeitsweisen"
  mit dem entscheidenden Satz: Claude *kann* die Aufgabe schon, der Skill legt fest, **wie sie bei uns
  gemacht wird**. Dazu ein Ohne-/Mit-Vergleich am Beispiel einer Standard-Antwort an Interessenten.
  Der Abgrenzungs-Ausklapper wurde mitgezogen (Faustregel „Können erweitern" → „immer gleiches
  Ergebnis sichern"), sonst hätte er dem neuen Abschnitt widersprochen.
- **Abgrenzung ergänzt, die erst durch v1.12.1 nötig wurde:** Modul 5 sagt „Verbinden macht die IT",
  Modul 3 sagt „Projekte darfst du in der Abteilung selbst teilen". Für Teilnehmer ist beides
  „etwas zugänglich machen" – jetzt steht ausdrücklich da, dass es zwei Vorgänge mit
  unterschiedlichen Regeln sind, samt Begründung (ganze Datenquelle ≠ geprüfte Datei).
- **Maßstab für die drei Prüffragen:** Die Übung verlangt, sie zu beantworten, ohne zu sagen, was eine
  gute Antwort ist. Jetzt: konkret statt pauschal (Ordnername + Inhalt), plus die Zweifelsregel – wer
  bei „Personenbezug?" zögern muss, hat die Antwort schon.

## [1.13.0] – 2026-07-29

### Added
- **Modul 4: Prompt Injection kommt jetzt hier vor, nicht erst in Modul 7.** Das ist die Stelle, an
  der das Risiko die Kategorie wechselt: Bis dahin kann Claude sich *irren* und man liest jede
  Antwort selbst — ab Cowork **handelt** er und macht Schritte, die niemand einzeln sieht. Der
  bestehende Freigaben-Callout lehrte schon den richtigen Reflex („nur bestätigen, was du
  verstehst"), nannte aber die Ursache nicht. Neuer Abschnitt mit dem konkreten Beispielsatz
  („Ignoriere alle vorherigen Anweisungen …"), drei Gewohnheiten (passt die Nachfrage zur Aufgabe ·
  woher kommt das Material · Auffälliges melden) und Verweis auf Modul 7. Bewusst an Modul 7
  angeschlossen formuliert — dort gilt der Grundsatz „Inhalt ist Material, kein Befehl", hier kommt
  dazu, dass die Grenze nicht immer trennscharf ist und beim Agenten schwerer wiegt.
- **Modul 4: Hinweis „Wo landet das Ergebnis?"** Für Claude Code warnt Modul 6 ausdrücklich bei
  „löschen, überschreiben, verschieben" — für Cowork fehlte das Gegenstück. Jetzt: Ergebnisse als
  *neue* Datei anlegen lassen, und bei Aufträgen mit „ersetzen/aufräumen/zusammenführen" ausdrücklich
  dazusagen, dass die Originale unangetastet bleiben.

### Changed
- **Modul 4 nennt keine festen Funktionsnamen mehr.** „Einrichtungsassistent" stand im Lernziel, im
  Abschnittstext *und* als Schritt 1 der Übung — heißt die Funktion anders oder fehlt sie, scheitert
  die Übung an ihrem ersten Schritt. Jetzt „der geführte Einstieg, den Cowork beim ersten Start
  anbietet", plus einem Satz an die Teilnehmer, dass die Oberfläche abweichen kann. Dieselbe Logik,
  die für Modellnamen schon galt.
- **Modul 4: Ampel-Check in der Übung ist wieder eine Frage.** Bisher „Waren alle verwendeten Inhalte
  grün? ✅" — das Häkchen nahm die Antwort vorweg, und zwar an der Stelle mit dem meisten Material.
  Jetzt: welche Farbe hatte das Material, woher kam es, und bei Dateien von außen: warum war das in
  Ordnung?
- **Trainer-Leitfaden, Modul 4:** Hinweis, den geführten Einstieg vorab selbst anzusehen, und der
  Kernsatz des Blocks (Claude *irrt* sich vorher, *handelt* ab hier).

## [1.12.1] – 2026-07-29

### Changed
- **Projekte teilen ist jetzt eine Regel statt einer offenen Frage** (Festlegung Dominik, 29.07.):
  innerhalb der eigenen Abteilung erlaubt, darüber hinaus vorher abstimmen. Der Hinweis in Modul 3
  formulierte bisher nur die Frage („gehört vielleicht trotzdem nicht in ein Projekt mit zwanzig
  Personen") – für Teilnehmer, die eine klare Ansage brauchen, war das zu weich. Der
  Datenschutz-Teil bleibt: geteilte Projekte teilen auch die Wissens-Dateien mit.
- **Trainer-Leitfaden:** Teilen-Regel bei Modul 3 hinterlegt, dazu der Prüf-Punkt („Wissens-Datei
  macht zuverlässiger, nicht fehlerfrei"). Bei Modul 1 die Rückfrage vermerkt, die verlässlich
  kommt – *„die Firmen-Version trainiert doch nicht mit unseren Daten"* – samt Ein-Satz-Antwort.
  Letzte Zeitangabe entfernt („lieber 10 Minuten mehr investieren" → „mehr Zeit als woanders").

## [1.12.0] – 2026-07-29

### Added
- **Modul 3: Prüf-Hinweis ergänzt** – die Seite erzeugte die stärkste Verlässlichkeits-Illusion der
  Schulung und war das einzige Inhaltsmodul ohne „du bleibst verantwortlich". Zwei Stellen wirkten
  zusammen: die Beispiel-Anweisung „sag offen, wenn etwas nicht in den Dateien steht" und der Satz
  „genauer und konsistenter" direkt darunter. Beides stimmt einzeln, gelesen wird daraus aber
  „hinterlegte Quelle = verlässlich". Jetzt ausdrücklich: die Anweisung senkt die Fehlerquote, sie
  garantiert nichts – und ein Fehler fällt hier **schwerer** auf, weil die Antwort nach dem eigenen
  Wissen klingt. Mit konkreter Handlung: Stichprobe gegen die Wissens-Datei, vor allem bei Zahlen,
  Fristen und Zuständigkeiten.
- **Modul 3: Hinweis zu geteilten Projekten.** Der Tipp empfiehlt Projekte zum Teilen im Team –
  damit sehen alle Projektmitglieder auch die Wissens-Dateien. Die Ampel beantwortet „darf das
  hinein?", beim Teilen kommt „und wer sieht es danach?" hinzu. Ein anonymisiertes internes Dokument
  ist für die KI unbedenklich, gehört aber nicht zwangsläufig in ein Projekt mit zwanzig Personen.
- **Modul 3: Ausklapper „Wie viel gehört in ein Projekt – und wann ist es zu viel?"** Bisher fehlte
  jeder Hinweis darauf, dass Wissens-Dateien Kontext kosten; Anfänger neigen dazu, alles
  hineinzuwerfen. Jetzt: zwei bis fünf gepflegte Dateien zu einem Thema schlagen zwanzig, Faustregel
  „ein Projekt = ein Zweck", plus dem bislang fehlenden Querverweis auf Vertiefung 1.
- **Modul 3: zwei weitere Projekt-Ideen** aus Schulbetrieb („Unterrichtsvorbereitung") und
  Verwaltung („Verwaltung & Schriftverkehr") – die drei bisherigen kamen alle aus dem
  Anerkennungsbereich. Ausklapper-Titel entsprechend von „Drei" auf „Fünf" korrigiert.

## [1.11.0] – 2026-07-29

### Changed
- **Ampel präzisiert: Gelb war an einer Stelle zu streng.** „Interne Dokumente ohne
  Namen/Kontaktdaten" stand unter Gelb – ohne Personenbezug greift der Datenschutz dort aber gar
  nicht. Solche Dokumente (Abläufe, Vorlagen, Checklisten) sind jetzt **grün**, mit der Bedingung
  „solange keine Person darin vorkommt". Gelb ist dafür klarer auf seinen eigentlichen Fall
  zugeschnitten: *enthält* Personenbezug, den du vorher entfernst. Neu dabei der Hinweis auf
  **indirekte** Erkennbarkeit (Standort + Datum + Beruf) – die Lücke, an der die Anonymisierung im
  Alltag scheitert und die Modul 7 im Quiz schon abfragt.
- **Neuer Hinweis „Zwei Fragen, die oft verwechselt werden".** Die Verschiebung nach Grün würde
  sonst eine neue Lücke öffnen: Kalkulationen, Verträge und Strategiepapiere enthalten häufig keine
  Personendaten, sind also grün im Sinne der Ampel – gehören aber trotzdem nicht in jedes Werkzeug.
  Personenbezug und Vertraulichkeit sind zwei verschiedene Prüfungen; das steht jetzt ausdrücklich da.

## [1.10.0] – 2026-07-29

### Changed
- **Anonymisierungs-Beispiel in Modul 1 ist jetzt erkennbar fiktiv.** Der Rot-Fall zeigte
  „Fatima Al-Rashid, geb. 12.03.1994, Krankenschwester aus Syrien, E-Mail fatima.a@…" – einen
  realistisch klingenden Personendatensatz, auf einer **öffentlich erreichbaren** Seite (das Repo
  ist public, weil der Org-Plan keine privaten Pages kann), und im Widerspruch zur eigenen
  Empfehlung „Muster Mustermann statt echter Personen" zwei Absätze darüber. Jetzt „Maria
  Musterfrau" mit ausdrücklichem Hinweis „frei erfundenes Beispiel"; Herkunftsland entfernt (für
  die Illustration unnötig, transportiert ein Stereotyp, und Herkunft ist selbst eine sensible
  Angabe). Struktur bleibt erhalten – Name + Geburtsdatum + Kontakt sind ja genau das, was den
  Fall rot macht – und ein Schlusssatz benennt das Prinzip: rot wird es durch die *Kombination*.
- **Ampel-Begründung nachgeschärft** (Modul 1 + FAQ in Modul 0). Bisher hieß es „Inhalte werden
  nicht zum Training verwendet – *trotzdem* gilt die Ampel", ohne das „trotzdem" zu erklären. Wer
  die Einstellung kennt, hält die Regel dann für Übervorsicht. Neuer Ausklapper „Warum ist das so
  streng?" mit vier Gründen in einfacher Sprache: Daten verlassen das Haus · Gesundheitsdaten sind
  besonders geschützt · für die Aufgabe braucht Claude den Namen nie · wir müssen Auskunft geben
  können. Ohne Paragraphen-Nummern.
- **Sperrige Gender-Konstruktion geglättet:** 4× „die/den bzw. der/dem Datenschutzbeauftragte:n"
  → „die Datenschutzbeauftragten". Es sind tatsächlich zwei Personen, damit ist der Plural auch
  sachlich richtiger. Die übrigen 11 Doppelpunkt-Formen (Kolleg:innen, Bewerber:innen,
  Interessent:innen) bleiben – die Brand Guideline verwendet sie selbst, das ist gesetzte CI.
- Modul 1: „Die Oberfläche in 60 Sekunden" → „im Überblick" (letzte Zeitangabe der Site).

### Added
- **Modul 1: Meldeweg für den Fall, dass doch etwas Rotes hochgeht.** Modul 7 hat den
  vollständigen Weg, aber Modul 1 ist das Modul, in dem zum ersten Mal wirklich hochgeladen und
  geübt wird – und der erste Reflex bei einem Fehler ist genau der falsche. Deshalb hier kurz:
  **nicht löschen**, stoppen, am selben Tag melden, notieren was drinstand, Verweis auf Modul 7.

## [1.9.0] – 2026-07-29

### Changed
- **Alle Zeitangaben entfernt** (34 Stellen): die „⏱️ ca. X Minuten" in allen 16 Modul-Köpfen und die
  Minuten in den 18 Übungs-Tags. Das Tempo hängt an der Gruppe, und die Angaben widersprachen sich
  gegenseitig. Zusätze in den Übungs-Tags bleiben erhalten („Denkaufgabe", „Korrektur",
  „Compliance-Check") – nur die Minuten sind weg.
- **Ampel-Zeichen bei Qualitätsvergleichen ersetzt.** 🔴/🟢 markierten an mehreren Stellen nicht
  Erlaubnis oder Risiko, sondern *Textqualität* – ausgerechnet in Modul 2, direkt nach der
  Ampel-Einführung in Modul 1. Umgestellt auf ✗/✓ mit neutralen Rahmen:
  - Modul 2: „Vage ↔ Klar" als Callout-Paar und im Tabellenkopf
  - Vertiefung 1: „Schwach ↔ Stark", zwei Paare
  - Deck: „Vage ↔ Klar" und „Was Claude ist ↔ ist nicht"
  - Aufbau 4: gutes ↔ schlechtes Skript, jetzt über `.infocard`
  - Vertiefung 1 „🟢 Deine fünf Gegenmittel" → 💡, Vertiefung 2 „🟢 VIDACTA-Beispiel" → 📌 (5×)
  Die Callout-Klassen `danger`/`tip` waren dort auch sachlich falsch: ein vager Prompt ist keine
  *Gefahr*. Farbig bleiben ausschließlich Verbote, Pflichten und die Ampel-Einordnung selbst.
- **Deck: farbiger Streifen der Ampelfolie zurückgeholt.** `.deck .ampel-card { border-color: … }`
  hat dieselbe Spezifität wie `.ampel-card.g/.a/.r` in `style.css` und gewinnt als späteres
  Stylesheet – die wichtigste Folie des Decks trug ihre Ampelfarben deshalb nur in den Punkten,
  nicht im Rand. Jetzt explizit im Deck-CSS gesetzt, mit Kommentar zur Ursache.

### Added
- **Modul 2: zweiter K-A-F-T-Prompt aus dem Schulbetrieb** (Doppelstunde vorbereiten) neben dem
  Beispiel aus dem Bewerbermanagement – damit sich beide Arbeitsbereiche wiederfinden.
- **Modul 2: neuer Abschnitt „Der häufigste Fall im Alltag: deinen eigenen Text verbessern lassen".**
  Alle bisherigen Beispiele ließen Claude etwas Neues schreiben; im Alltag ist der Ausgangspunkt
  meist ein eigener Entwurf. Mit kopierbarem Prompt (erst Schwächen benennen, dann verbessern,
  keine Fakten ändern, bei fehlender Information nachfragen) und der Datenschutz-Warnung, die
  genau hier hingehört: der eigene Entwurf enthält oft echte Personendaten.
- CSS-Muster `.callout.nein` / `.callout.ja` für Qualitätsvergleiche ohne Ampelfarben.

## [1.8.0] – 2026-07-29

### Changed
- **Ampelfarben sind jetzt allein der Datenschutz-Ampel vorbehalten.** Die grün/gelb/rot-Karten
  standen an 13 Stellen – aber nur an 8 davon bewertet die Farbe wirklich eine Erlaubnis oder ein
  Risiko. In Modul 0 lernte der Teilnehmer das Schema deshalb zuerst mit der *falschen* Bedeutung
  (dort stufte es Fähigkeiten ein), obwohl die 🚦 Ampel laut Trainer-Leitfaden der rote Faden des
  ganzen Tages ist. Fünf Blöcke auf ein neutrales Kartenmuster umgestellt:
  - Modul 0 „Stark / Mit Vorsicht / Nicht dafür da" – Fähigkeiten, keine Datenfreigabe
  - Modul 3 „Projekt lohnt sich / Normaler Chat reicht" – zwei gleichwertige Wege, Gelb war keine Warnung
  - Modul 5 „Bevor etwas verbunden wird: drei Fragen" – Farbe war reine Dekoration, jetzt nummeriert 1/2/3
  - Modul 6 „Könnte sich lohnen / Eher nicht nötig" – Entscheidungshilfe
  - Vertiefung 1 „Gute Gewohnheiten / Der ‚Neustart'-Trick" – zwei Tipps
  Unverändert farbig bleiben die acht Blöcke mit echter Erlaubnis- oder Risiko-Aussage:
  Datenschutz-Ampel in Modul 1, Modul 7 und im Deck, Browser-Ampel (Aufbau 1), Ton-Regeln und
  Skript-Vergleich (Aufbau 4), DSGVO-Lead-Wege (Aufbau 5), Vertrauens-Check (Vertiefung 1).
- **Modul 0: zweiter Beispiel-Prompt neutral formuliert.** Er beschrieb VIDACTA nur als
  „Bildungsunternehmen für die Anerkennung ausländischer Pflegekräfte" – wer an einer unserer
  Berufsfachschulen arbeitet, fand sich darin nicht wieder und bekam entsprechend unpassende
  Vorschläge. Jetzt Schulen *und* Anerkennungsbegleitung, dazu der Hinweis, den ersten Satz an
  den eigenen Bereich anzupassen.
- **Trainer-Leitfaden: fester Tagesablauf entfernt.** Die Uhrzeiten-Tabelle widersprach den
  Modul-Angaben (20-Minuten-Slot für Deck-Intro *und* ein 15-Minuten-Modul) und gab ein Tempo vor,
  das an der Gruppe hängt. Ersetzt durch Reihenfolge + Gewichtung (nie streichen / Kern mit viel
  Übungszeit / kann ins Selbstlernen) samt Kurz-Variante – ohne Zeitangaben.

### Added
- CSS-Muster `.infogrid` / `.infocard` für neutrale Karten, mit optionalem Nummern-Badge `.idx`.
  Ein Kommentar im Stylesheet hält fest, warum dort keine Ampelfarben verwendet werden.
- CSS-Muster `.hint` für einen kurzen Hinweis direkt unter einem Prompt-Block.

## [1.7.1] – 2026-07-27

### Fixed
- **Präsentation: „Live-Moment"-Pillen liefen über die volle Folienbreite** (1072 px statt
  263–361 px, auf allen drei Live-Folien). Ursache: `.live-badge` ist `inline-flex`, wird als
  Flex-Item von `.slide` aber **blockifiziert** (`inline-flex` → `flex`) und dann von
  `align-items: stretch` auf Containerbreite gezogen. Fix: `align-self: flex-start`.
  Geprüft bei 1280×800, 1920×1080 und 375×812 – Pillen sitzen exakt auf Inhaltsbreite.

## [1.7.0] – 2026-07-27

### Added
Content-Audit über alle 19 Seiten (6 parallele Fach-Reviewer + adversariale Gegenprobe gegen
die VIDACTA-Regeln), **49 geprüfte Ergänzungen eingebaut**. Die dünnsten Seiten waren
Präsentation, Modul 8, Aufbau 1 und Aufbau 4 (Bewertung 2 von 5).

- **Eröffnungs-Deck: 11 → 15 Folien.** Vier inhaltliche Lücken geschlossen, die eine
  Workshop-Eröffnung nicht haben darf: „Das machen Kolleg:innen heute schon" (konkrete
  Anwendungsfälle statt abstraktem Nutzen), **„Claude kann sich überzeugend irren"** als Regel Nr. 2
  direkt nach dem ersten Live-Prompt, „Was Claude ist – und was nicht" (keine Rechts-/
  medizinische/amtliche Auskunft) und ein Cowork-Vorgeschmack. Dazu das vierte Tages-Versprechen
  (Ergebnisse prüfen) und ein konkreter Ausblick auf Vertiefung und Aufbau-Track.
- **Modul 8** (dünnste Grundlagen-Seite): Spick-Hilfe „So sieht ein guter Durchlauf aus" mit
  Beispiel-Prompt, „Ich hänge fest – wo schaue ich nach?", fünf typische Stolperfallen und eine
  Ergebnis-Check-Tabelle (Prüf-Frage / gut gelaufen / Warnsignal).
- **Modul 7:** Anonymisieren-Vorher/Nachher inkl. Warnung vor identifizierenden Kombinationen,
  Übung 7b mit den kniffligen Grauzonen-Fällen.
- **Modul 4:** Tabelle mit fünf Büroalltags-Aufträgen, zweiter kopierbarer Beispiel-Auftrag
  (Info-Nachmittag), „Was tun, wenn das Ergebnis nicht passt?".
- **Modul 5:** Vorher-nachher-Tabelle zum Connector-Nutzen, Abgrenzung Wissens-Datei/Connector/Skill,
  Muster-Anfrage an die IT.
- **Modul 3:** Tabelle „Gute Projektanweisungen schreiben", drei Projekt-Ideen, zwei FAQ-Blöcke
  (Chat-Upload vs. Wissens-Datei, veraltete Inhalte).
- **Modul 0/1/2/6:** Vorher/Nachher-Beispiel (Stichpunkte → E-Mail), „Claude ist keine Suchmaschine",
  Warnung „Anonymisieren heißt vorher – nicht durch Claude", Ampel-Quiz mit Auflösung,
  Vage/Klar-Tabelle für drei Alltagsaufgaben, Prompt-FAQ, „Was macht diesen Auftrag sicher?".
- **Aufbau 1:** vier Marketing-Anwendungsfälle mit Standard-Prompt, konkretes
  Prompt-Injection-Beispiel, Browser-Ampel (welche Seiten darf Claude mitlesen), zweite Übung.
- **Aufbau 4:** Längentabelle Reel → Skript, gutes vs. schlechtes VO-Skript im Direktvergleich,
  Prüf-Prompt für verbotene Claims, Korrektur-Übung „Skript-Klinik", Musik-Briefing-Prompt.
- **Aufbau 2/3/5:** Zuordnungstabelle Aufgabe → Werkzeug, Abgrenzung Connector vs. Werkzeug,
  Muster-Lösung zur Denkaufgabe, Briefing-Vorlage als Prompt, gutes vs. schwaches Briefing,
  Prüf-Prompt für Anzeigen-Ideen, Tabelle „Typische Fehler – und was stattdessen".
- **Vertiefung 1/2:** Vertrauens-Check (wie viel Prüfung braucht welches Ergebnis – klar abgegrenzt
  von der Eingabe-Ampel), drei Alltagsfragen zum Kontext, Selbst-Test mit fünf Situationen,
  Einstiegs-Empfehlung „Womit fange ich an?".

Alle Ergänzungen nutzen ausschließlich bestehende Bausteine und Fakten aus der Schulung –
keine neuen Produktnamen, Zahlen oder UI-Beschreibungen.

## [1.6.3] – 2026-07-27

### Fixed
Mobil-Audit über alle 19 Seiten bei 320/375/414 px – vier Befunde behoben:

- **Diagramme waren auf dem Handy unlesbar:** Die SVG-Beschriftungen wurden auf ~7 px
  heruntergerechnet. Unter 640 px bekommen sie jetzt eine Mindestbreite von 640 px und die Figur
  scrollt seitlich (gleiches Muster wie `.table-scroll`) – Text effektiv ~11,6 px. Die
  Bildunterschrift bleibt per `position: sticky` stehen und ergänzt den Hinweis
  „seitlich wischen, um alles zu sehen".
- **Copy-Buttons zu klein:** 25 px hoch (unter jeder Touch-Empfehlung). Auf Mobil jetzt 38 px
  und unter den Prompt-Text gesetzt, statt oben rechts über dem Text zu schweben.
- **Deck-Folie 6 (Ampel) wurde abgeschnitten:** Auf schmalen/niedrigen Displays scrollen die
  Folien jetzt (oben ausgerichtet, kompaktere Karten, ausgeblendeter Tastatur-Hinweis).
- **Lange deutsche Komposita sprengten das Layout** („Stellen-/Ausbildungsanzeigen" ergab
  32 px Überlauf auf aufbau-5, Prompt-Tokens 5 px auf aufbau-4): global
  `overflow-wrap: break-word`, in Prompts `anywhere`.
- Zusätzlich: Kopfzeile bei ≤380 px kompakter (stand 7 px über), Silbentrennung
  (`hyphens: auto`) für Fließtext auf Mobil – deutlich ruhigerer Flattersatz.

## [1.6.2] – 2026-07-27

### Changed
- Startseite: Der Deck-Hinweis war ein loser Absatz unter dem Workbrain-Banner und wirkte
  unplatziert. Ersetzt durch eine **Trainer-Karte** (`.trainer-card`) im Raster des
  Promo-Banners: gleiche Breite, heller Untergrund mit Sky-Akzentkante links, Eyebrow
  „Für Trainer", Titel und eigener Button. Kontrast in Hell und Dunkel über WCAG AA,
  bricht auf Mobil sauber um.

## [1.6.1] – 2026-07-27

### Changed
- Startseite: Trainer-Hinweis mit Link auf das Eröffnungs-Deck (`praesentation.html`)
  unter dem Workbrain-Banner – das Deck ist jetzt von der Site aus erreichbar.

## [1.6.0] – 2026-07-27

### Added
- **Workshop-Eröffnungs-Deck `praesentation.html`** (animierte Browser-Präsentation für den
  Trainer, 11 Folien): eigene Folien-Engine ohne Build-Step (Pfeiltasten/Klick, Fragments,
  Fortschrittsbalken, Hash-Deep-Links, `prefers-reduced-motion`-sicher), Dark-Navy-Look auf Basis
  der vorhandenen Design-Tokens (`data-theme="dark"` + style.css). **Drei markierte
  „Live-Momente"**, bei denen alle Teilnehmer an ihrem eigenen Claude-Team-Seat mitmachen:
  erster Prompt (Copy-Button wie auf der Site), Ampel-Zuruf-Quiz mit aufdeckbaren Antworten,
  „Mach du den Prompt besser". Inhalte 1:1 aus den Modulen (kein neuer Faktenstand).
- Trainer-Leitfaden: Intro-Block zum Deck + Checklisten-Punkt „Vor dem Workshop".

## [1.5.0] – 2026-07-27

### Added
- **Modul 7: neuer Abschnitt „Versteckte Anweisungen in Dokumenten & Webseiten"** (Prompt
  Injection für Nicht-Techniker: Material ≠ Auftrag, Vorsicht bei fremden Dateien, Abbrechen &
  Melden) – das Risiko stand bisher nur im Browser-Modul (Aufbau 1); Folgeabschnitt umnummeriert.
- **Modul 8: Challenge-Variante C „Bewerber-Kommunikation"** (Beratung/Bewerbermanagement) mit
  bewusstem Anonymisierungs-Schritt – die Rolle mit dem höchsten Datenschutz-Risiko hatte keine
  eigene Abschlussaufgabe.
- **Aufbau 3: Alltagskleidung-Regel** (VIDACTA-Kontext = Alltagskleidung, keine Kasacks/Scrubs;
  Schule ≠ Klinik; positiv briefen) als Gestaltungsregel, QA-Punkt und Compliance-Kurzcheck-Eintrag.
- **Modul 2: zweiter Profi-Kniff „Claude zuerst fragen lassen"** (Rückfragen-Trick).
- **Trainer-Leitfaden: Abschnitt Vertiefungs-Track** (Selbstlernen als Standard oder
  60–90-Minuten-Kurzblock) + Checklisten-Punkt „Nach dem Workshop" – der Track aus v1.3.0 fehlte
  im Leitfaden komplett.
- Modul 0: Websuche als Abhilfe bei aktuellen Themen erwähnt (Ampel-Karte „Mit Vorsicht") und
  FAQ-Eintrag, dass der Lern-Fortschritt nur lokal im Browser gespeichert wird.
- Modul 7: Querverweis auf Vertiefung 1 (Halluzinationen im Detail) – analog zu den bestehenden
  Querverweisen aus Modul 2 und 3.

### Fixed
- Aufbau 3: QA-Punkt „realistische Pflege-/Arbeitssituation" lenkte Richtung Klinik-Optik –
  ersetzt durch „Schul-/Lern-Kontext, Alltagskleidung statt Kasack".
- Trainer-Leitfaden: „Klарmachen" enthielt zwei kyrillische Homoglyphen (а/р) → „Klarmachen".

## [1.4.0] – 2026-07-27

### Changed
- **Raleway selbst gehostet** (`fonts/`, Quelle @fontsource, SIL Open Font License; 5 Gewichte,
  Subsets latin + latin-ext): Google-Fonts-Einbindung von allen 18 Seiten entfernt – keine
  IP-Übertragung an Google-Server mehr. Die Schulung lehrt die Datenschutz-Ampel; jetzt hält
  sich die Site selbst daran.
- **Deutsche Typografie:** Geviertstriche (—) site-weit durch Halbgeviertstriche (–) ersetzt
  (alle HTML-Seiten, app.js, README, Trainer-Leitfaden).
- Vertiefung 1: Modell-Aussagen versionsfest formuliert („jede neue Modell-Generation" statt
  konkreter Versionsnamen wie „Opus 4.8") – der Text veraltet nicht mehr mit jedem Modellwechsel.
- Modul 8: „Wie es weitergeht" verlinkt jetzt Vertiefungs- und Aufbau-Track; die
  „Weiter"-Navigation führt zu Vertiefung 1 statt zurück zur Übersicht (durchgehender Lernpfad).
- Startseite: Hero-Text nennt die Tracks in Seiten-Reihenfolge (Grundlagen → Vertiefung → Aufbau);
  Fortschrittslabel präzisiert („Grundlagen-Modulen", auch in app.js).

### Added
- Favicon (VIDACTA-Zeichen `vidacta-mark.svg`) auf allen 18 Seiten.

### Fixed
- Modul 0: verunglückter Satz („nichts installieren-verstehen") korrigiert.
- Vertiefung 1: Tippfehler „prompted" → „promptet".

## [1.3.0] – 2026-07-24

### Added
- **Vertiefungs-Track „Claude verstehen & voll ausnutzen"** (eigener Bereich auf der Startseite,
  eigener Fortschrittsbalken; bestehende Module 0–8 unverändert):
  - **Vertiefung 1 – Wie Claude wirklich funktioniert:** KI-Grundwissen (Sprachmodell = Wort-Vorhersage,
    „Sprach-Genie, kein Fakten-Tresor"), zusätzliche gute/schlechte Prompt-Beispiele (K-A-F-T),
    „Was ist Kontext?" (Kontextfenster/Schreibtisch-Analogie, Tokens), **Kontextmüdigkeit / Context Rot /
    „Dumb Zone"** mit **erklärendem Inline-SVG-Chart** (Fehlerquote ↑ je länger der Chat; grün/gelb/rot,
    bewusst ohne Messwerte) + Gegenmittel, und **Halluzinationen** (3 Ursachen inkl. „Raten wird belohnt",
    5 Gegenmittel mit „Nicht-wissen erlauben" zuerst, ehrliche Einordnung neuerer Modelle wie Opus 4.8:
    gemildert, nicht gelöst). Faktenbasis via verifizierter Recherche (Chroma „Context Rot" 2025,
    „Lost in the Middle" Liu et al. 2023) — keine erfundenen Zahlen, kein Fest-Nageln an Versionen.
  - **Vertiefung 2 – Claude Desktop voll ausnutzen:** Projekte (Wiederholung), Artefakte (Galerie +
    Teilen per Link), Routinen, Anpassen (inkl. Stile) und Geplant (Cloud-Lauf) — jeweils mit
    VIDACTA-Beispiel, Sidebar-Übersichts-Diagramm, „Spickzettel"-Tabelle und ehrlichem Hinweis, dass
    Routinen/Geplant sich je nach Version/Produkt überschneiden.
- Startseite: dritter Bereich („Vertiefung") + dritter Fortschrittsbalken; Hero-Text ergänzt.
  Querverweise aus Modul 2 → Vertiefung 1 und Modul 3 → Vertiefung 2 (in den Durchklick-Fluss eingehängt).
- `app.js`: Vertiefungs-Liste (IDs 10–11), dritter Fortschrittsbalken, dezente Chart-Reveal-Animation
  (IntersectionObserver, `prefers-reduced-motion`-sicher; Kurve ist ohne JS/Animation trotzdem sichtbar).
- `style.css`: theme-fähige Chart-Stile (`svg.dia .curve/.zone*/.axis` …) und leichte Tabellen-Stile.

### Fixed
- Startseiten-„Erledigt"-Haken wurde nur im ersten Modul-Grid gesetzt (`querySelector` →
  `querySelectorAll`); jetzt korrekt in allen Bereichen (Grundlagen, Vertiefung, Aufbau).

## [1.2.0] – 2026-07-22

### Added
- **Workbrain-Pitch-Seite** (`workbrain.html`): erklärt das Mitarbeiter-Claude-Produkt (ADR-009) im
  Pitch-Stil — Problem, Vision („mehrere Gedächtnisse, die sich teilen"), konzentrisches
  Ring-Diagramm (0 öffentlich-fähig · 1 intern · 2 Abteilung · 3 GF), Wissensfluss (einordnen → PR →
  Kurator, DSGVO-Gate), Nutzen-Karten, CTA. Navy-Pitch-Hero + Ring-Legende (neue Pitch-Stile in CSS).
- Startseite: Promo-Banner „Workbrain — unser mitwachsendes Firmengehirn" verlinkt den Pitch.
- Bewusst ohne interne Admin-Details/IDs auf der öffentlichen Seite (Ringe konzeptuell benannt).

## [1.1.0] – 2026-07-22

### Added
- **Aufbau-Track „Kreativ- & Marketing-Werkzeuge"** (rollenspezifisch, eigener Fortschrittsbalken):
  - Aufbau 1: Claude im Browser (Chrome-Erweiterung) inkl. Browser-Sicherheit/Prompt-Injection.
  - Aufbau 2: Connectors & KI-Werkzeuge (Überblick, Claude als Steuerzentrale, Credits/Kosten).
  - Aufbau 3: Bilder & Videos mit Higgsfield — KI-Kennzeichnungspflicht (Art. 50), Claim-Regeln, Safe Zones, Reel 9:16.
  - Aufbau 4: Ton, Sprache & Musik mit ElevenLabs — deutsche VO, eine Stimme/Reel, BGM −15 dB, GEMA-Falle.
  - Aufbau 5: Social Ads Meta & Google — DSGVO-Lead-Regeln (nur Website/v-forms), EMPLOYMENT-Targeting, GA4/generate_lead, Read-only-Default.
- Startseite: zweiter Bereich + zweiter Fortschrittsbalken; `app.js` um Aufbau-Liste erweitert.
- Trainer-Leitfaden um Aufbau-Track ergänzt.

## [1.0.0] – 2026-07-22

### Added
- Projekt-Init: Doku-Struktur, `implementation_plan.md` aus Brainstorming.
- Site-Gerüst: `index.html`, `style.css`, `app.js`, Komponenten (Ampel-Regel, Tipp/Achtung-Boxen, Copy-Buttons, Fortschritt).
- Alle 9 Module ausformuliert (Modul 0–8): Willkommen, Desktop Basics, Prompten, Projekte & Wissen,
  Cowork, Skills & Connectors, Claude Code (Ausblick), Sicherheit & DSGVO, Abschluss-Challenge.
- Trainer-Leitfaden für Ganztags-Workshop (`docs/trainer-leitfaden.md`).
- Veröffentlichung auf GitHub Pages: <https://vidacta.github.io/claude-schulung/>

### Hinweise
- Screenshots sind aktuell Platzhalter — echte Bilder aus der Team/Enterprise-Umgebung folgen.
