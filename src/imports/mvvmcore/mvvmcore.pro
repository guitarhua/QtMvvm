QT += core qml quick mvvmcore
CXX_MODULE = mvvmcore
TARGETPATH = de/skycoder42/qtmvvm/core
TARGET  = declarative_mvvmcore
IMPORT_VERSION = 1.0

HEADERS += \
	qtmvvmcore_plugin.h \
	qqmlmvvmbinding.h \
    qqmlmvvmmessage.h

SOURCES += \
	qtmvvmcore_plugin.cpp \
	qqmlmvvmbinding.cpp \
    qqmlmvvmmessage.cpp

OTHER_FILES += qmldir

generate_qmltypes {
	typeextra1.target = qmltypes
	typeextra1.depends += export LD_LIBRARY_PATH := "$$shadowed($$dirname(_QMAKE_CONF_))/lib/:$(LD_LIBRARY_PATH)"
	typeextra2.target = qmltypes
	typeextra2.depends += export QML2_IMPORT_PATH := "$$shadowed($$dirname(_QMAKE_CONF_))/qml/"
	QMAKE_EXTRA_TARGETS += typeextra1 typeextra2
}

load(qml_plugin)

generate_qmltypes {
	qmltypes.depends = ../../../qml/$$TARGETPATH/$(TARGET)  #overwrite the target deps

	mfirst.target = all
	mfirst.depends += qmltypes
	QMAKE_EXTRA_TARGETS += mfirst
}