ADAC=gnatmake
ADAFLAGS=-O3
BINS=words makedict makestem makeinfl makeefil makeewds
SOURCES=*.ads *.adb

all: words \
	STEMLIST.GEN DICTFILE.GEN INDXFILE.GEN STEMFILE.GEN EWDSFILE.GEN INFLECTS.SEC \
	ADDONS.LAT UNIQUES.LAT

STEMLIST.GEN: DICTFILE.GEN

DICTFILE.GEN: makedict DICTLINE.GEN
	yes G | ./makedict

INDXFILE.GEN: STEMFILE.GEN

STEMFILE.GEN: makestem STEMLIST.GEN
	yes G | ./makestem

EWDSFILE.GEN: makeewds DICTLINE.GEN makeefil
	yes G | ./makeewds
	./makeefil

INFLECTS.SEC: makeinfl INFLECTS.LAT
	yes G | ./makeinfl

words: $(SOURCES)
	$(ADAC) $(ADAFLAGS) words

makedict: $(SOURCES)
	$(ADAC) $(ADAFLAGS) makedict

makestem: $(SOURCES)
	$(ADAC) $(ADAFLAGS) makestem

makeinfl: $(SOURCES)
	$(ADAC) $(ADAFLAGS) makeinfl

makeefil: $(SOURCES)
	$(ADAC) $(ADAFLAGS) makeefil

makeewds:$(SOURCES)
	$(ADAC) $(ADAFLAGS) makeewds

