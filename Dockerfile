#Basis-Image auswählen (offizielles Python-Image)
FROM python:3.11

# Arbeitsverzeichnis im Container erstellen
WORKDIR /app

#Abhängigkeiten kopieren und installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Projektdateien kopieren
COPY babyshop_app /app/

#Django-Projekt vorbereiten (Migrationen, statische Dateien sammeln)
RUN python manage.py collectstatic --noinput
RUN python manage.py migrate

#Exponiere den Port, auf dem die Anwendung läuft
EXPOSE 8025

CMD ["python", "manage.py", "runserver", "0.0.0.0:8025"]