# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zrb/my_muduo/my_muduo/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zrb/my_muduo/my_muduo/src/build

# Include any dependencies generated for this target.
include CMakeFiles/my_program.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my_program.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_program.dir/flags.make

CMakeFiles/my_program.dir/Poller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Poller.cc.o: ../Poller.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/Poller.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/Poller.cc.o -c /home/zrb/my_muduo/my_muduo/src/Poller.cc

CMakeFiles/my_program.dir/Poller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Poller.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/Poller.cc > CMakeFiles/my_program.dir/Poller.cc.i

CMakeFiles/my_program.dir/Poller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Poller.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/Poller.cc -o CMakeFiles/my_program.dir/Poller.cc.s

CMakeFiles/my_program.dir/Poller.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/Poller.cc.o.requires

CMakeFiles/my_program.dir/Poller.cc.o.provides: CMakeFiles/my_program.dir/Poller.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/Poller.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/Poller.cc.o.provides

CMakeFiles/my_program.dir/Poller.cc.o.provides.build: CMakeFiles/my_program.dir/Poller.cc.o

CMakeFiles/my_program.dir/EventLoop.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EventLoop.cc.o: ../EventLoop.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/EventLoop.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/EventLoop.cc.o -c /home/zrb/my_muduo/my_muduo/src/EventLoop.cc

CMakeFiles/my_program.dir/EventLoop.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EventLoop.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/EventLoop.cc > CMakeFiles/my_program.dir/EventLoop.cc.i

CMakeFiles/my_program.dir/EventLoop.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EventLoop.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/EventLoop.cc -o CMakeFiles/my_program.dir/EventLoop.cc.s

CMakeFiles/my_program.dir/EventLoop.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/EventLoop.cc.o.requires

CMakeFiles/my_program.dir/EventLoop.cc.o.provides: CMakeFiles/my_program.dir/EventLoop.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/EventLoop.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/EventLoop.cc.o.provides

CMakeFiles/my_program.dir/EventLoop.cc.o.provides.build: CMakeFiles/my_program.dir/EventLoop.cc.o

CMakeFiles/my_program.dir/main.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/main.cc.o: ../main.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/main.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/main.cc.o -c /home/zrb/my_muduo/my_muduo/src/main.cc

CMakeFiles/my_program.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/main.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/main.cc > CMakeFiles/my_program.dir/main.cc.i

CMakeFiles/my_program.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/main.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/main.cc -o CMakeFiles/my_program.dir/main.cc.s

CMakeFiles/my_program.dir/main.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/main.cc.o.requires

CMakeFiles/my_program.dir/main.cc.o.provides: CMakeFiles/my_program.dir/main.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/main.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/main.cc.o.provides

CMakeFiles/my_program.dir/main.cc.o.provides.build: CMakeFiles/my_program.dir/main.cc.o

CMakeFiles/my_program.dir/Channel.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Channel.cc.o: ../Channel.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/Channel.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/Channel.cc.o -c /home/zrb/my_muduo/my_muduo/src/Channel.cc

CMakeFiles/my_program.dir/Channel.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Channel.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/Channel.cc > CMakeFiles/my_program.dir/Channel.cc.i

CMakeFiles/my_program.dir/Channel.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Channel.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/Channel.cc -o CMakeFiles/my_program.dir/Channel.cc.s

CMakeFiles/my_program.dir/Channel.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/Channel.cc.o.requires

CMakeFiles/my_program.dir/Channel.cc.o.provides: CMakeFiles/my_program.dir/Channel.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/Channel.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/Channel.cc.o.provides

CMakeFiles/my_program.dir/Channel.cc.o.provides.build: CMakeFiles/my_program.dir/Channel.cc.o

CMakeFiles/my_program.dir/Tcpserver.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Tcpserver.cc.o: ../Tcpserver.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/Tcpserver.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/Tcpserver.cc.o -c /home/zrb/my_muduo/my_muduo/src/Tcpserver.cc

CMakeFiles/my_program.dir/Tcpserver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Tcpserver.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/Tcpserver.cc > CMakeFiles/my_program.dir/Tcpserver.cc.i

CMakeFiles/my_program.dir/Tcpserver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Tcpserver.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/Tcpserver.cc -o CMakeFiles/my_program.dir/Tcpserver.cc.s

CMakeFiles/my_program.dir/Tcpserver.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/Tcpserver.cc.o.requires

CMakeFiles/my_program.dir/Tcpserver.cc.o.provides: CMakeFiles/my_program.dir/Tcpserver.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/Tcpserver.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/Tcpserver.cc.o.provides

CMakeFiles/my_program.dir/Tcpserver.cc.o.provides.build: CMakeFiles/my_program.dir/Tcpserver.cc.o

CMakeFiles/my_program.dir/EPollPoller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EPollPoller.cc.o: ../EPollPoller.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/EPollPoller.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/EPollPoller.cc.o -c /home/zrb/my_muduo/my_muduo/src/EPollPoller.cc

CMakeFiles/my_program.dir/EPollPoller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EPollPoller.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/EPollPoller.cc > CMakeFiles/my_program.dir/EPollPoller.cc.i

CMakeFiles/my_program.dir/EPollPoller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EPollPoller.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/EPollPoller.cc -o CMakeFiles/my_program.dir/EPollPoller.cc.s

CMakeFiles/my_program.dir/EPollPoller.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/EPollPoller.cc.o.requires

CMakeFiles/my_program.dir/EPollPoller.cc.o.provides: CMakeFiles/my_program.dir/EPollPoller.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/EPollPoller.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/EPollPoller.cc.o.provides

CMakeFiles/my_program.dir/EPollPoller.cc.o.provides.build: CMakeFiles/my_program.dir/EPollPoller.cc.o

CMakeFiles/my_program.dir/CurrentThread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/CurrentThread.cc.o: ../CurrentThread.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/CurrentThread.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/CurrentThread.cc.o -c /home/zrb/my_muduo/my_muduo/src/CurrentThread.cc

CMakeFiles/my_program.dir/CurrentThread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/CurrentThread.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/CurrentThread.cc > CMakeFiles/my_program.dir/CurrentThread.cc.i

CMakeFiles/my_program.dir/CurrentThread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/CurrentThread.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/CurrentThread.cc -o CMakeFiles/my_program.dir/CurrentThread.cc.s

CMakeFiles/my_program.dir/CurrentThread.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/CurrentThread.cc.o.requires

CMakeFiles/my_program.dir/CurrentThread.cc.o.provides: CMakeFiles/my_program.dir/CurrentThread.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/CurrentThread.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/CurrentThread.cc.o.provides

CMakeFiles/my_program.dir/CurrentThread.cc.o.provides.build: CMakeFiles/my_program.dir/CurrentThread.cc.o

CMakeFiles/my_program.dir/Thread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Thread.cc.o: ../Thread.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/Thread.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/Thread.cc.o -c /home/zrb/my_muduo/my_muduo/src/Thread.cc

CMakeFiles/my_program.dir/Thread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Thread.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/Thread.cc > CMakeFiles/my_program.dir/Thread.cc.i

CMakeFiles/my_program.dir/Thread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Thread.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/Thread.cc -o CMakeFiles/my_program.dir/Thread.cc.s

CMakeFiles/my_program.dir/Thread.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/Thread.cc.o.requires

CMakeFiles/my_program.dir/Thread.cc.o.provides: CMakeFiles/my_program.dir/Thread.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/Thread.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/Thread.cc.o.provides

CMakeFiles/my_program.dir/Thread.cc.o.provides.build: CMakeFiles/my_program.dir/Thread.cc.o

CMakeFiles/my_program.dir/EventLoopThread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EventLoopThread.cc.o: ../EventLoopThread.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/EventLoopThread.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/EventLoopThread.cc.o -c /home/zrb/my_muduo/my_muduo/src/EventLoopThread.cc

CMakeFiles/my_program.dir/EventLoopThread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EventLoopThread.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/EventLoopThread.cc > CMakeFiles/my_program.dir/EventLoopThread.cc.i

CMakeFiles/my_program.dir/EventLoopThread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EventLoopThread.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/EventLoopThread.cc -o CMakeFiles/my_program.dir/EventLoopThread.cc.s

CMakeFiles/my_program.dir/EventLoopThread.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/EventLoopThread.cc.o.requires

CMakeFiles/my_program.dir/EventLoopThread.cc.o.provides: CMakeFiles/my_program.dir/EventLoopThread.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/EventLoopThread.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/EventLoopThread.cc.o.provides

CMakeFiles/my_program.dir/EventLoopThread.cc.o.provides.build: CMakeFiles/my_program.dir/EventLoopThread.cc.o

CMakeFiles/my_program.dir/DefaultPoller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/DefaultPoller.cc.o: ../DefaultPoller.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/DefaultPoller.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/DefaultPoller.cc.o -c /home/zrb/my_muduo/my_muduo/src/DefaultPoller.cc

CMakeFiles/my_program.dir/DefaultPoller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/DefaultPoller.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/DefaultPoller.cc > CMakeFiles/my_program.dir/DefaultPoller.cc.i

CMakeFiles/my_program.dir/DefaultPoller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/DefaultPoller.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/DefaultPoller.cc -o CMakeFiles/my_program.dir/DefaultPoller.cc.s

CMakeFiles/my_program.dir/DefaultPoller.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/DefaultPoller.cc.o.requires

CMakeFiles/my_program.dir/DefaultPoller.cc.o.provides: CMakeFiles/my_program.dir/DefaultPoller.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/DefaultPoller.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/DefaultPoller.cc.o.provides

CMakeFiles/my_program.dir/DefaultPoller.cc.o.provides.build: CMakeFiles/my_program.dir/DefaultPoller.cc.o

CMakeFiles/my_program.dir/InetAddress.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/InetAddress.cc.o: ../InetAddress.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/InetAddress.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/InetAddress.cc.o -c /home/zrb/my_muduo/my_muduo/src/InetAddress.cc

CMakeFiles/my_program.dir/InetAddress.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/InetAddress.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/InetAddress.cc > CMakeFiles/my_program.dir/InetAddress.cc.i

CMakeFiles/my_program.dir/InetAddress.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/InetAddress.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/InetAddress.cc -o CMakeFiles/my_program.dir/InetAddress.cc.s

CMakeFiles/my_program.dir/InetAddress.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/InetAddress.cc.o.requires

CMakeFiles/my_program.dir/InetAddress.cc.o.provides: CMakeFiles/my_program.dir/InetAddress.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/InetAddress.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/InetAddress.cc.o.provides

CMakeFiles/my_program.dir/InetAddress.cc.o.provides.build: CMakeFiles/my_program.dir/InetAddress.cc.o

CMakeFiles/my_program.dir/Timestamp.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Timestamp.cc.o: ../Timestamp.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/my_program.dir/Timestamp.cc.o"
	/opt/rh/devtoolset-7/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_program.dir/Timestamp.cc.o -c /home/zrb/my_muduo/my_muduo/src/Timestamp.cc

CMakeFiles/my_program.dir/Timestamp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Timestamp.cc.i"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zrb/my_muduo/my_muduo/src/Timestamp.cc > CMakeFiles/my_program.dir/Timestamp.cc.i

CMakeFiles/my_program.dir/Timestamp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Timestamp.cc.s"
	/opt/rh/devtoolset-7/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zrb/my_muduo/my_muduo/src/Timestamp.cc -o CMakeFiles/my_program.dir/Timestamp.cc.s

CMakeFiles/my_program.dir/Timestamp.cc.o.requires:
.PHONY : CMakeFiles/my_program.dir/Timestamp.cc.o.requires

CMakeFiles/my_program.dir/Timestamp.cc.o.provides: CMakeFiles/my_program.dir/Timestamp.cc.o.requires
	$(MAKE) -f CMakeFiles/my_program.dir/build.make CMakeFiles/my_program.dir/Timestamp.cc.o.provides.build
.PHONY : CMakeFiles/my_program.dir/Timestamp.cc.o.provides

CMakeFiles/my_program.dir/Timestamp.cc.o.provides.build: CMakeFiles/my_program.dir/Timestamp.cc.o

# Object files for target my_program
my_program_OBJECTS = \
"CMakeFiles/my_program.dir/Poller.cc.o" \
"CMakeFiles/my_program.dir/EventLoop.cc.o" \
"CMakeFiles/my_program.dir/main.cc.o" \
"CMakeFiles/my_program.dir/Channel.cc.o" \
"CMakeFiles/my_program.dir/Tcpserver.cc.o" \
"CMakeFiles/my_program.dir/EPollPoller.cc.o" \
"CMakeFiles/my_program.dir/CurrentThread.cc.o" \
"CMakeFiles/my_program.dir/Thread.cc.o" \
"CMakeFiles/my_program.dir/EventLoopThread.cc.o" \
"CMakeFiles/my_program.dir/DefaultPoller.cc.o" \
"CMakeFiles/my_program.dir/InetAddress.cc.o" \
"CMakeFiles/my_program.dir/Timestamp.cc.o"

# External object files for target my_program
my_program_EXTERNAL_OBJECTS =

my_program: CMakeFiles/my_program.dir/Poller.cc.o
my_program: CMakeFiles/my_program.dir/EventLoop.cc.o
my_program: CMakeFiles/my_program.dir/main.cc.o
my_program: CMakeFiles/my_program.dir/Channel.cc.o
my_program: CMakeFiles/my_program.dir/Tcpserver.cc.o
my_program: CMakeFiles/my_program.dir/EPollPoller.cc.o
my_program: CMakeFiles/my_program.dir/CurrentThread.cc.o
my_program: CMakeFiles/my_program.dir/Thread.cc.o
my_program: CMakeFiles/my_program.dir/EventLoopThread.cc.o
my_program: CMakeFiles/my_program.dir/DefaultPoller.cc.o
my_program: CMakeFiles/my_program.dir/InetAddress.cc.o
my_program: CMakeFiles/my_program.dir/Timestamp.cc.o
my_program: CMakeFiles/my_program.dir/build.make
my_program: CMakeFiles/my_program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable my_program"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_program.dir/build: my_program
.PHONY : CMakeFiles/my_program.dir/build

CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/Poller.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/EventLoop.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/main.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/Channel.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/Tcpserver.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/EPollPoller.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/CurrentThread.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/Thread.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/EventLoopThread.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/DefaultPoller.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/InetAddress.cc.o.requires
CMakeFiles/my_program.dir/requires: CMakeFiles/my_program.dir/Timestamp.cc.o.requires
.PHONY : CMakeFiles/my_program.dir/requires

CMakeFiles/my_program.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_program.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_program.dir/clean

CMakeFiles/my_program.dir/depend:
	cd /home/zrb/my_muduo/my_muduo/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zrb/my_muduo/my_muduo/src /home/zrb/my_muduo/my_muduo/src /home/zrb/my_muduo/my_muduo/src/build /home/zrb/my_muduo/my_muduo/src/build /home/zrb/my_muduo/my_muduo/src/build/CMakeFiles/my_program.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_program.dir/depend

