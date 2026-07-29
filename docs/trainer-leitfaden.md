# Trainer-Leitfaden – Claude-Schulung (Ganztag)

Leitfaden für die Person, die die Schulung **live** durchführt. Die Selbstlern-Site
(<https://vidacta.github.io/claude-schulung/>) ist gleichzeitig deine „Folie" – teile den Bildschirm
und klick sie mit der Gruppe durch.

> **Grundprinzip:** Nicht vorlesen. Vormachen → gemeinsam nachmachen → selbst ausprobieren.
> Nach jedem Modul eine echte Übung, bevor es weitergeht.

---

## Vor dem Workshop (Checkliste)

- [ ] Alle Teilnehmer haben einen funktionierenden Claude-Zugang (Team/Enterprise) und sind eingeloggt.
- [ ] **Plätze zählen.** Reichen die vorhandenen Zugänge für alle Teilnehmer? Wenn nicht: zu zweit an
      einem Platz arbeiten lassen — das funktioniert für **alle** Übungen. Vorher festlegen, wer tippt,
      und nach der Hälfte tauschen.
- [ ] **Verfügbare Funktionen im eigenen Plan durchklicken** und notieren, was es gibt: Projekte,
      Artefakte, Anpassen, Routinen, Geplant. Vertiefung 2 ist bewusst mit Vorbehalt formuliert
      („kann je nach Version abweichen"), weil das von außen nicht feststellbar ist — im Workshop
      kannst du dagegen konkret sagen, was bei uns vorhanden ist. Das ersetzt vier Relativierungen
      im Text durch eine klare Ansage.
- [ ] Claude Desktop-App auf den Rechnern installiert (oder Browser-Zugang geklärt).
- [ ] Beamer/Screenshare getestet, Site geöffnet.
- [ ] **Eröffnungs-Deck** geöffnet: `praesentation.html` (Pfeiltasten/Klick zum Weiterschalten;
      die drei „Live-Moment"-Folien = alle Teilnehmer machen an ihrem eigenen Claude mit).
- [ ] **Presenter-Modus einrichten**, wenn du zwei Bildschirme hast — siehe unten. Einmal
      durchklicken, damit du im Workshop nicht mit Fenstern hantierst.
- [ ] **Grüne Beispiel-Materialien** vorbereitet: ein öffentlicher Info-Text, ein anonymisiertes
      „Protokoll", ein paar Stichpunkte. Nichts Personenbezogenes!
- [ ] Interne Ansprechpartner für Datenschutz/IT bereithalten (für Modul 5–7).
- [ ] Screenshots auf der Site gegen die tatsächliche Umgebung gegengecheckt.

---

## Reihenfolge & Gewichtung

Die Module bauen aufeinander auf. Reihenfolge:

**Intro (Deck) → 0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8**, dann Fragen/Feedback/Ausblick.

Bewusst **kein** fester Zeitplan – das Tempo hängt an der Gruppe. Woran du dich stattdessen
orientierst, wenn es knapp wird:

| Gewicht | Module | Warum |
|---|---|---|
| **Nie streichen** | 1 (Ampel) · 7 (Sicherheit & DSGVO) | Rechtliche Grundlage und roter Faden des Tages |
| **Kern – viel Übungszeit** | 2 (Prompten) · 4 (Cowork) | Hier entsteht der Aha-Effekt; lieber hier länger bleiben |
| **Kann ins Selbstlernen** | 5 · 6 · 8 | Verständnis- bzw. Übungseinheiten, auch allein machbar |

> Kurz-Variante: Deck + Module 0–4 + 7. Den Rest als Selbstlernen mitgeben.
>
> Puffer einplanen: Pausen nach Bedarf, und Modul 7 nie unter Zeitdruck durchziehen.

---

## Didaktische Hinweise je Modul

**Intro (Deck).** Starte mit dem Eröffnungs-Deck `praesentation.html` (inkl. der drei
Live-Momente): erster Prompt am eigenen Team-Seat, Ampel-Zuruf, Prompt verbessern. Die drei
Live-Momente leiten nahtlos in Modul 0–2 über – danach ist jeder schon eingeloggt und hat
seinen ersten Chat geführt.

Das Deck läuft in **sechs Kapiteln** (Kapitelname steht unten links, die Kerben in der
Fortschrittsleiste zeigen, wie weit ein Kapitel noch trägt):

| Kapitel | Folien | Was du hier erreichen willst |
|---|---|---|
| 1 · Ankommen | 1–4 | Angst nehmen, Fahrplan zeigen, **alle einloggen** |
| 2 · Der erste Kontakt | 5–8 | Erster eigener Prompt, dann die zwei Merksätze: Claude ist eine Zuarbeit, und er kann sich überzeugend irren |
| 3 · Wie das Ding funktioniert | 9–12 | Die drei „unter der Haube"-Fragen: Wortvorhersage, Harness, Modellwahl |
| 4 · Die Ampel | 13–15 | Das Herzstück – Ampel, Zuruf-Quiz, KI-Kennzeichnung |
| 5 · Handwerk & Werkzeuge | 16–21 | Prompt-Qualität, Cowork-Vorgeschmack, Ablage, VIDACTA-Skills |
| 6 · Los geht's | 22 | Übergang in Modul 0 |

### Presenter-Modus (zwei Bildschirme)

Wenn dein Laptop am Beamer hängt, kannst du auf dem Laptop-Display eine Trainer-Ansicht
laufen lassen, während der Beamer nur die Folien zeigt.

**Einrichten (zwei Fenster, eine Minute):**

1. Beamer-Fenster: `praesentation.html` öffnen und auf den Beamer schieben, dann `F11` für Vollbild.
2. Auf dem Laptop-Display ein zweites Fenster mit **`praesentation.html?presenter`** öffnen.
3. Fertig. Du blätterst im Presenter-Fenster, das Beamer-Fenster folgt automatisch.

**Was du im Presenter-Fenster siehst:** die aktuelle Folie, daneben die **nächste**, darunter die
**Notizen zu genau dieser Folie**, und unten Folienzähler, Aufdeck-Stand („2 / 3“ = zwei von drei
Klick-Elementen sichtbar), Timer und eine Anzeige, ob das Beamer-Fenster wirklich mithört
(grüner Punkt = folgt).

**Gut zu wissen:**

- Es reicht in **eine** Richtung: Du kannst auch im Beamer-Fenster blättern, der Presenter folgt.
- Die Verbindung läuft nur **innerhalb desselben Browsers** (mehrere Fenster oder Tabs). Sie ist
  ausdrücklich *nicht* für die Geräte der Teilnehmer gedacht — dafür gibt es Beamer und
  Screenshare.
- Zeigt die Anzeige „kein Beamer-Fenster“, hast du das zweite Fenster in einem anderen Browser
  (oder im privaten Modus) offen. Beide Fenster im gleichen Browser öffnen.
- Der Timer ist ein reiner Anhaltspunkt für dich. Er läuft nicht automatisch mit — Start und
  Zurücksetzen liegen bei dir, und **es gibt keine Sollzeiten** (bewusst, das Tempo hängt an
  der Gruppe).
- Wenn du **ohne** zweiten Bildschirm arbeitest: einfach `praesentation.html` nehmen, alles
  funktioniert wie vorher.
- Direkt zu einer Folie springen geht über die Adresse: `praesentation.html#13` — auch mit
  Aufdeck-Stand, z. B. `#13.1`. Praktisch, wenn du nach einer Pause wieder einsteigst.

**Kapitel 3 ist neu und optional kürzbar.** Wenn die Gruppe ungeduldig ist: Folie 10
(Wortvorhersage) und 11 (Harness) sind die beiden, die sich am meisten lohnen – die Modellwahl
(Folie 12) können Teilnehmer auch in Vertiefung 3 nachlesen. Umgekehrt: Wenn früh die Frage
„welches Modell nehme ich?" kommt, hast du sie hier schon im Deck.

**Zwei Fragen, auf die du im Deck vorbereitet sein solltest:**

- *„Warum darf ich ChatGPT nicht nutzen?"* – kommt fast immer, meist bei Folie 12.
  Kurzantwort: nicht wegen der Qualität, sondern weil für jedes Werkzeug geklärt sein muss, wer
  die Daten bekommt. Ausführlich steht das in Vertiefung 3; vertief es im Workshop nur, wenn
  gefragt wird, sonst bremst es.
- *„Welches Modell habe ich denn?"* – lass die Teilnehmer selbst ins Auswahlmenü über dem
  Eingabefeld schauen, statt es zu behaupten. Das hängt am Plan und ändert sich.

**Modul 0 – Willkommen.** Wichtigstes Ziel: Angst nehmen. Lass alle in den ersten 5 Minuten einen
eigenen Chat abschicken (im Deck-Intro meist schon passiert – dann hier nur vertiefen).
Betone: „Man kann nichts kaputt machen."

**Modul 1 – Desktop + Ampel.** Die 🚦 Ampel ist das Herzstück des ganzen Tages. Lieber hier mehr Zeit
investieren als woanders. Lass jeden laut einen eigenen Fall einer Farbe zuordnen. Der Ausklapper
„Warum ist das so streng?" fängt die Rückfrage ab, die verlässlich kommt: *„Die Firmen-Version
trainiert doch nicht mit unseren Daten – warum dann so streng?"* Antwort in einem Satz: weil jeder
Upload Daten aus dem Haus gibt, unabhängig vom Training.

**Modul 2 – Prompten.** Der größte Aha-Effekt. Zeig live denselben Auftrag einmal vage, einmal mit
K-A-F-T – der Unterschied überzeugt mehr als jede Erklärung. Viel Übungszeit geben.

**Modul 3 – Projekte.** Gemeinsam ein „Textbausteine"-Projekt bauen. Betone: nur grüne/anonyme Inhalte.
**Teilen ist geregelt** (Festlegung Dominik, 29.07.): innerhalb der eigenen Abteilung erlaubt, darüber
hinaus vorher abstimmen — der Datenschutz gilt unverändert, weil geteilte Projekte auch die
Wissens-Dateien mitteilen. Zweiter Punkt, der leicht untergeht: eine hinterlegte Wissens-Datei macht
Antworten zuverlässiger, aber nicht fehlerfrei — Stichprobe bleibt Pflicht, gerade weil die Antwort
dann nach dem eigenen Haus klingt.

**Modul 4 – Cowork (Kern).** Genug Zeit einplanen. Lass die Gruppe den geführten Einstieg durchlaufen
(**vorher selbst ansehen** — die Oberfläche wird weiterentwickelt, die Seite ist deshalb absichtlich
ohne feste Funktionsnamen formuliert). Zeig eine echte mehrstufige Aufgabe und wie man das Ergebnis
prüft. **Der wichtigste Satz des Blocks:** Bis hierhin konnte Claude sich *irren*, ab jetzt *handelt*
er — deshalb steht Prompt Injection schon hier und nicht erst in Modul 7. Wenn die Gruppe nur eine
Sache mitnimmt, dann: Passt die Nachfrage nicht zur Aufgabe, wird abgebrochen, nicht bestätigt.

**Modul 5 – Connectors.** Reine Verständnis-Einheit. Klarmachen: Verbinden macht die IT, nicht jeder
selbst. Denkaufgabe statt Klick-Übung.

**Modul 6 – Dateien & Ordner.** Das Modul hat jetzt **zwei Teile mit unterschiedlichem Gewicht.**
*Teil 1 (für alle)* beantwortet „wo ist meine Datei jetzt?" – die Frage, die im Workshop
garantiert kommt. Geh die drei Fälle kurz durch (Chat = kein Verzeichnis, Cowork = eigener
Arbeitsbereich, Code = echter Ordner) und lande auf der einen Regel: **das Ergebnis gehört in die
Team-Ablage, nicht in den Chatverlauf.** Aufgabe 6a lässt sich in wenigen Minuten am eigenen
Rechner machen und lohnt sich – viele finden dabei ein Ergebnis von letzter Woche, das nirgends
abgelegt ist. *Teil 2 (Claude Code)* bleibt bewusst kurz & entspannt: „Gut zu wissen, kein Muss."
Niemanden unter Druck setzen, nur mit IT-Freigabe praktisch zeigen.

**Modul 7 – Sicherheit (Pflicht).** Ernst, aber nicht angstmachend. Die Ampel-Zuordnungsübung gemeinsam
lösen. Interne Ansprechpartner konkret benennen.

**Modul 8 – Challenge.** Jeder wählt eine Variante und arbeitet selbstständig; du gehst herum und hilfst.
Am Ende: Fortschrittsbalken auf 100 %, kurzes Erfolgserlebnis feiern.

---

## Vertiefungs-Track (Claude verstehen) – Selbstlernen oder Kurzblock

Die drei Vertiefungs-Module (V1 „Wie Claude wirklich funktioniert", V2 „Claude Desktop voll
ausnutzen", V3 „Modelle & Werkzeuge") sind für **alle** gedacht, passen aber nicht mehr in den
Ganztag. Zwei bewährte Wege:

- **Selbstlernen (Standard):** Am Tagesende als „Hausaufgabe der Woche" mitgeben – V1 zuerst.
  Alle drei Module sind eigenständig verständlich und haben eigene Übungen.
- **Kurzblock (optional):** eigener Follow-up-Termin, wenn erste Alltagserfahrung da
  ist – dann zünden Kontext/„Dumb Zone" und die Desktop-Funktionen am besten.

Inhaltlicher Anker fürs Anmoderieren: V1 erklärt, *warum* die Regeln aus Modul 2 und 7
funktionieren (Kontext, Halluzinationen); V2 macht aus Modul 3 fünf Zeitspar-Werkzeuge
(Projekte, Artefakte, Routinen, Anpassen, Geplant); **V3 beantwortet die zwei Fragen, die im
Workshop immer kommen** – warum Cowork mehr kann als der Chat (das Modell ist nur der Kopf, das
Programm drumherum gibt die Werkzeuge) und welches Modell man wofür nimmt.

**V3 ist der Anlaufpunkt für die Anbieter-Frage.** Wenn im Workshop „aber ChatGPT kann doch …"
kommt und du nicht ausufern willst: dort steht die vollständige Antwort inklusive des
konstruktiven Wegs (Werkzeug-Idee einbringen statt still nutzen). Verweisen statt diskutieren.

---

## Aufbau-Track (Kreativ & Marketing) – separater Termin

Die fünf Aufbau-Module (Chrome-Extension, Connectors, Higgsfield, ElevenLabs, Meta/Google Ads) sind
**rollenspezifisch** – nur für Marketing/Content, nicht für alle. Empfehlung: **eigener Halbtag** nach
der Grundschulung, nur mit dem betreffenden Team.

- **Voraussetzung:** Grundlagen (v. a. Datenschutz-Ampel) sitzen.
- **Roter Faden hier:** Regeln vor Werkzeug. Die Compliance-Punkte sind kein Beiwerk, sondern der Kern:
  **KI-Kennzeichnungspflicht** (Art. 50), **keine Geld-/„jeden Monat"-Versprechen**, **Azubi-Leads nur
  über Website/v-forms**, **Meta-EMPLOYMENT-Targeting** (Alter 18–65, kein Detail-Targeting), **eine
  Stimme pro Reel**, **GEMA-Falle** (keine Instagram-Musik).
- **Kosten betonen:** Higgsfield/ElevenLabs verbrauchen Credits, Ads geben echtes Budget aus →
  Schalten/Budget nur durch Berechtigte, Read-only-Default.
- **Interne Details vorbereiten:** KI-Icon-Dateien, richtige GA4-Property-ID, Zugänge – diese stehen
  bewusst NICHT auf der öffentlichen Seite, bring sie zum Termin mit.
- **Praxis nur mit Freigabe:** live generieren/schalten nur, wenn Zugänge geklärt sind; sonst als
  Briefing-/Denkübungen fahren (die Übungen A1–A5 sind so angelegt, dass sie ohne Credits funktionieren).

---

## Häufige Fragen der Teilnehmer (Spickzettel)

- **„Sieht mein Chef meine Chats?"** → Firmen-Version, Arbeitsinhalte nachvollziehbar; Privates nicht in den Arbeits-Account.
- **„Werden meine Eingaben zum Training verwendet?"** → In der Firmen-Version nicht; trotzdem Ampel beachten.
- **„Was, wenn Claude falsch liegt?"** → Passiert (Halluzination). Deshalb prüfen wir. Verantwortung bleibt bei uns.
- **„Muss ich programmieren können?"** → Nein. Desktop & Cowork brauchen keinerlei Technik.

---

## Nach dem Workshop

- [ ] Link zur Selbstlern-Site verteilen (zum Nachschlagen).
- [ ] Vertiefungs-Module (V1/V2/V3) als Selbstlern-Empfehlung mitgeben (siehe oben).
- [ ] Abschluss-Vermerk/Zertifikat für Teilnehmer ausstellen (optional).
- [ ] Feedback einsammeln → in die Schulung einarbeiten.
- [ ] Interessenten für Aufbaukurs (Claude Code / Connectors) notieren.
