.PHONY: all debug debug release run test

all: build/libunicornafl

build:
	mkdir build

unicorn/build/libunicorn-common.a:
	cmake -S unicorn/ -B build/unicorn -D BUILD_SHARED_LIBS=no
	$(MAKE) -C ./build/unicorn -j8

build/libunicornafl: build unicorn/build/libunicorn-common.a
	cd ./build && cmake .. -D BUILD_SHARED_LIBS=no
	$(MAKE) -C ./build -j8

format:
	format.sh

clean:
	rm -rf build
	rm -rf ./unicorn/build
