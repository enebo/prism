ifeq ($(shell uname), Darwin)
SOEXT := dylib
else
SOEXT := so
endif

build/librubyparser.$(SOEXT): $(shell find src -name '*.c') $(shell find src -name '*.h') Makefile build src/ast.h
	$(CC) -Wall -Werror -fPIC -g -fvisibility=hidden -shared -Isrc -o $@ $(shell find src -name '*.c')

# TODO: static compile librubyparser to allow it to statically link to JNI .so
# TODO: this will need to compile on Windows.
build/libjavaparser.$(SOEXT): $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)
	$(CC) $(CFLAGS) -Bstatic -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" -Isrc -Ijni -shared -o $@ $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)

java: build/libjavaparser.$(SOEXT)

build:
	mkdir -p build

src/ast.h: bin/templates/src/ast.h.erb
	rake $@

clean:
	rm -f build/librubyparser.$(SOEXT) ext/yarp/node.c lib/yarp/{node,serialize}.rb src/{ast.h,node.{c,h},prettyprint.c,serialize.c,token_type.c}

.PHONY: clean
