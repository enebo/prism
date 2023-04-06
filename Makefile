ifeq ($(shell uname), Darwin)
SOEXT := dylib
else
SOEXT := so
endif

# Check for the presence of strnlen
ifeq ($(shell echo '\#include <string.h>\nint main() { strnlen("", 0); }' | $(CC) -o /dev/null -x c - 2>/dev/null && echo 1), 1)
CFLAGS := -DHAVE_STRNLEN
endif

# Check for the presence of strncasecmp
ifeq ($(shell echo '\#include <string.h>\nint main() { strncasecmp("", "", 0); }' | $(CC) -o /dev/null -x c - 2>/dev/null && echo 1), 1)
CFLAGS := $(CFLAGS) -DHAVE_STRNCASECMP
endif

# Check for the presence of strnstr
ifeq ($(shell echo '\#include <string.h>\nint main() { strnstr("", "", 0); }' | $(CC) -o /dev/null -x c - 2>/dev/null && echo 1), 1)
CFLAGS := $(CFLAGS) -DHAVE_STRNSTR
endif

all: build/librubyparser.$(SOEXT)

build/librubyparser.$(SOEXT): $(shell find src -name '*.c') $(shell find src -name '*.h') Makefile build include/yarp/ast.h
	$(CC) $(CFLAGS) $(DEBUG_FLAGS) -O3 -std=c99 -Wall -Werror -Wextra -Wpedantic -Wsign-conversion -Wno-missing-field-initializers -Wno-uninitialized -fPIC -g -fvisibility=hidden -shared -Iinclude -o $@ $(shell find src -name '*.c')

# TODO: this will need to compile on Windows.
build/libjavaparser.$(SOEXT): $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)
	$(CC) $(CFLAGS) -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" -Iinclude -Ijni -fPIC -shared -O3 -o $@ $(shell find jni -name '*.c') $(shell find src -name '*.c') 


#	$(CC) $(CFLAGS) -Bstatic -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux" -Isrc -Ijni -shared -o $@ $(shell find jni -name '*.c') build/librubyparser.$(SOEXT)

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
		jruby/org/yarp/{AbstractNodeVisitor.java,Loader.java,Nodes.java} \
		lib/yarp/{node,serialize}.rb \
		src/{node.c,prettyprint.c,serialize.c,token_type.c}

.PHONY: clean

all-no-debug: DEBUG_FLAGS := -DNDEBUG=1
all-no-debug: all
