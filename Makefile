ifeq ($(shell uname), Darwin)
SOEXT := dylib
else
SOEXT := so
endif

build/librubyparser.$(SOEXT): $(shell find src -name '*.c') $(shell find src -name '*.h') Makefile build include/yarp/ast.h
	$(CC) -Wall -Werror -fPIC -g -fvisibility=hidden -shared -Iinclude -o $@ $(shell find src -name '*.c')

# TODO: static compile librubyparser to allow it to statically link to JNI .so
# TODO: this will need to compile on Windows.
build/libjavaparser.$(SOEXT): $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)
	$(CC) $(CFLAGS) -Bstatic -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" -Isrc -Ijni -shared -o $@ $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)

java: build/libjavaparser.$(SOEXT)

build:
	mkdir -p build

include/yarp/ast.h: bin/templates/include/yarp/ast.h.erb
	rake $@

clean:
	rm -f \
		build/librubyparser.$(SOEXT) \
		ext/yarp/node.c \
		include/{ast.h,node.h} \
		java/org/yarp/{AbstractNodeVisitor.java,Loader.java,Nodes.java} \
		lib/yarp/{node,serialize}.rb \
		src/{node.c,prettyprint.c,serialize.c,token_type.c} \
		src/util/yp_strspn.c

.PHONY: clean
