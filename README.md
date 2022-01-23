# FME buildings detection

To repozytorium zawiera gotowe skrypty przeznaczone do stworzenia systemu autodetekcji budynków z obrazów.
Wykonaj poniższe kroki:
1. Pobierz i zainstaluj pakiety FME Workbench i MATLAB.
2. Znajdź i pobierz zbiór uczący do detekcji budynków (preferowana wysokorozdzielcza ortofotomapa)
3. Jeśli Twój zbiór uczący zawiera etykiety w postaci pliku TIF, załaduj je jako plik wejściowy do skryptu MakeAttribute.fmw i uruchom go. Zostanie utworzony plik adnotacji. W przypadku, gdy Twój zbiór nie posiada etykiet budynków, utwórz je samodzielnie uruchamiając w terminalu polecenie:
```
& path\FME\plugins\opencv\opencv_annotation.exe -a="new_annotation_file.txt" -i="path_to_file_with_images" -m=10000 -r=4
```
4. Jeśli Twój zbiór uczący nie posiada negatywów utwórz je uruchamiając skrypt trainlabel.m uzupełniając ścieżki do plików, gdzie:
- str1 - obrazy etykiet TIF
- str2 - obrazy zdjęć lotniczych
- str3 - nowoutworzone pozytywy
- str4 - powiększone etykiety
5. Uruchom skrypt BuildingDetector.fmw i uzupełnij funkcje RasterObjectDetectorSamplePreparer podając względne ścieżki do pliku negatywów i pliku adnotacji oraz obraz na którym zostanie wykonana detekcja budynków, podłączonego do funkcji Counter.
Gotowe! Twój obraz po detekcji zostanie zapisany na podane wyjście funkcji MapnikRasterizer.
