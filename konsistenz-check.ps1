# Konsistenz-Check für die Claude-Schulung
#
# Prüft alle Seiten gegen die Regeln, die im Durchgang vom 29.07.2026 gesetzt wurden.
# Hintergrund: Die Seiten verweisen aufeinander und wiederholen dieselben Definitionen
# (vor allem die Datenschutz-Ampel). Wer eine Seite ändert, macht damit leicht eine
# andere inkonsistent — beim Modul-für-Modul-Durchgang sind so drei Folgefehler
# entstanden, die erst dieser Check gefunden hat.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File .\konsistenz-check.ps1
#
# Nach JEDER inhaltlichen Änderung laufen lassen. Ausgabe „0 Befunde" ist das Ziel.
# Ergänzend für die Typografie: .claude/scripts/fix-quotes.ps1 (Trockenlauf)

$repo = $PSScriptRoot
if (-not $repo) { $repo = "C:\Dev\claude-schulung" }
$dateien = Get-ChildItem (Join-Path $repo '*.html')
$befunde = @()

function Melde($regel, $ort, $text) {
    $script:befunde += [pscustomobject]@{ Regel = $regel; Ort = $ort; Fund = $text }
}

foreach ($d in $dateien) {
    $t = [System.IO.File]::ReadAllText($d.FullName)
    # sichtbarer Text: script/style und alle Tags entfernen
    $sichtbar = [regex]::Replace([regex]::Replace($t, '(?s)<(script|style)\b[^>]*>.*?</\1>', ''), '<[^>]*>', ' ')
    $n = $d.Name

    # 1 Keine Zeitangaben — das Tempo hängt an der Gruppe (Festlegung Dominik 29.07.)
    foreach ($m in [regex]::Matches($sichtbar, 'ca\.\s*\d+\s*(Minuten|Sekunden)|\d+\s*Minuten\s*·')) {
        Melde '1 Zeitangabe' $n $m.Value
    }

    # 2 Deutsche Typografie: „…“ — gerade Zoll-Zeichen sind halbfertig, Paare müssen aufgehen
    $ger = ([regex]::Matches($sichtbar, [regex]::Escape([char]0x0022))).Count
    if ($ger -gt 0) { Melde '2 Typografie' $n "$ger gerade Anfuehrungszeichen" }
    $a = ([regex]::Matches($sichtbar, [regex]::Escape([char]0x201E))).Count
    $z = ([regex]::Matches($sichtbar, [regex]::Escape([char]0x201C))).Count
    if ($a -ne $z) { Melde '2 Typografie' $n "unpaarig: $a Oeffner / $z Schliesser" }

    # 3 Keine realistischen Personendatensätze — das Repo ist PUBLIC (Org-Plan kann keine
    #   privaten Pages). Beispielnamen müssen erkennbar fiktiv sein ("Muster…").
    foreach ($m in [regex]::Matches($sichtbar, '(?:(?:Frau|Herr)\s+)?[A-ZÄÖÜ][a-zäöüß]+\s+[A-ZÄÖÜ][a-zäöüß]+,\s*geb\.|(?:Frau|Herr)\s+[A-ZÄÖÜ][a-zäöüß]+,\s*geb\.')) {
        if ($m.Value -notmatch 'Muster') { Melde '3 Personendaten' $n $m.Value.Trim() }
    }

    # 4 Zurückgenommene Aussagen und veraltete Begriffe dürfen nicht wieder auftauchen
    $alt = @(
        'Einrichtungsassistent',                    # UI-Name, kann sich ändern (v1.13.0)
        'datenschutzrechtlich unkritisch',          # keine Rechtszusage auf der Seite (v1.14.0)
        'Können erweitern',                         # alte Skill-Faustregel (v1.14.0)
        'saubere Tabelle bauen',                    # irreführendes Skill-Beispiel (v1.14.0)
        'gibt es einen eigenen, tieferen Aufbaukurs',# Kurs existiert noch nicht (v1.15.0)
        'interne Dokumente ohne Namen',             # in Modul 1 nach Grün verschoben (v1.11.0)
        'interne Texte ohne Namen',                 # dito, Modul 7 + Deck (v1.16.0)
        'Waren alle verwendeten Inhalte grün'       # Ampel-Check ohne vorweggenommene Antwort (v1.13.0)
    )
    foreach ($b in $alt) { if ($sichtbar -match [regex]::Escape($b)) { Melde '4 Veralteter Begriff' $n $b } }

    # 5 Gender: Doppelpunkt-Form ist CI (Brand Guideline), aber keine Schrägstrich-Konstruktionen
    foreach ($m in [regex]::Matches($sichtbar, '(die/den|der/dem|die/der)\s+\w+')) { Melde '5 Gender-Form' $n $m.Value }
    foreach ($m in [regex]::Matches($sichtbar, 'Datenschutzbeauftragte:[nr]')) { Melde '5 Gender-Form' $n $m.Value }

    # 6 Modell-Aussagen versionsfest halten (kein Fest-Nageln an Modellnamen)
    foreach ($m in [regex]::Matches($sichtbar, '(Opus|Sonnet|Haiku)\s*\d')) { Melde '6 Modellname' $n $m.Value }

    # 7 Interne Links: Zieldatei UND Anker müssen existieren
    foreach ($m in [regex]::Matches($t, 'href="([a-z0-9\-]+\.html)(#([a-zA-Z0-9\-]+))?"')) {
        $ziel = $m.Groups[1].Value
        if (-not (Test-Path (Join-Path $repo $ziel))) { Melde '7 Toter Link' $n $ziel }
        elseif ($m.Groups[3].Success) {
            $anker = $m.Groups[3].Value
            $zt = [System.IO.File]::ReadAllText((Join-Path $repo $ziel))
            if ($zt -notmatch ('id="' + [regex]::Escape($anker) + '"')) { Melde '7 Toter Anker' $n "$ziel#$anker" }
        }
    }
}

# 8 Ampelfarben (grün/gelb/rot) nur dort, wo die Farbe eine Erlaubnis oder ein Risiko
#   bewertet. Fähigkeiten, Alternativen und Prüffragen nutzen .infogrid/.infocard (v1.8.0).
$erlaubt = @('modul-1.html','modul-7.html','praesentation.html','aufbau-1.html','aufbau-4.html','aufbau-5.html','vertiefung-1.html')
foreach ($d in $dateien) {
    $anz = ([regex]::Matches([System.IO.File]::ReadAllText($d.FullName), 'class="ampel-card')).Count
    if ($anz -gt 0 -and $d.Name -notin $erlaubt) { Melde '8 Ampelfarbe' $d.Name "$anz Ampel-Karten (nicht freigegeben)" }
}

# 9 Ampel-Definitionen müssen zwischen Modul 1, Modul 7 und Deck deckungsgleich sein —
#   hier entstand der Folgefehler aus v1.11.0.
$defs = @{}
foreach ($n in @('modul-1.html','modul-7.html','praesentation.html')) {
    $t = [System.IO.File]::ReadAllText((Join-Path $repo $n))
    $roh = (([regex]::Matches($t, '(?s)<div class="ampel-card [gar]"[^>]*>.*?</ul>') | ForEach-Object { $_.Value }) -join ' ')
    $defs[$n] = @{
        GelbPersonenbezug    = ($roh -match 'mit Personenbezug')
        GelbInterneOhneNamen = ($roh -match 'interne (Texte|Dokumente) ohne Namen')
        Indirekt             = ($roh -match 'indirekt')
    }
}
foreach ($n in $defs.Keys) {
    if ($defs[$n].GelbInterneOhneNamen) { Melde '9 Ampel-Definition' $n 'Gelb enthaelt noch "interne … ohne Namen"' }
    if (-not $defs[$n].GelbPersonenbezug) { Melde '9 Ampel-Definition' $n 'Gelb nennt nicht "mit Personenbezug"' }
    if (-not $defs[$n].Indirekt) { Melde '9 Ampel-Definition' $n 'Hinweis auf indirekte Erkennbarkeit fehlt' }
}

Write-Host "`n🔍 KONSISTENZ-CHECK claude-schulung" -ForegroundColor Cyan
Write-Host ("=" * 78) -ForegroundColor DarkGray
if ($befunde.Count -eq 0) {
    Write-Host "Keine Befunde — alle Regeln eingehalten." -ForegroundColor Green
} else {
    $befunde | Sort-Object Regel, Ort | Format-Table -AutoSize -Wrap
    Write-Host "Befunde: $($befunde.Count)" -ForegroundColor Yellow
}
Write-Host ("Geprueft: " + $dateien.Count + " Seiten, 9 Regelgruppen") -ForegroundColor DarkGray
Write-Host ""
