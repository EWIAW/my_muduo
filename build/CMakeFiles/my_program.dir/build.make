# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/linux/my_muduo/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/linux/my_muduo/src/build

# Include any dependencies generated for this target.
include CMakeFiles/my_program.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/my_program.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/my_program.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_program.dir/flags.make

CMakeFiles/my_program.dir/Acceptor.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Acceptor.cc.o: ../Acceptor.cc
CMakeFiles/my_program.dir/Acceptor.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my_program.dir/Acceptor.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Acceptor.cc.o -MF CMakeFiles/my_program.dir/Acceptor.cc.o.d -o CMakeFiles/my_program.dir/Acceptor.cc.o -c /root/linux/my_muduo/src/Acceptor.cc

CMakeFiles/my_program.dir/Acceptor.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Acceptor.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Acceptor.cc > CMakeFiles/my_program.dir/Acceptor.cc.i

CMakeFiles/my_program.dir/Acceptor.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Acceptor.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Acceptor.cc -o CMakeFiles/my_program.dir/Acceptor.cc.s

CMakeFiles/my_program.dir/Buffer.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Buffer.cc.o: ../Buffer.cc
CMakeFiles/my_program.dir/Buffer.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/my_program.dir/Buffer.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Buffer.cc.o -MF CMakeFiles/my_program.dir/Buffer.cc.o.d -o CMakeFiles/my_program.dir/Buffer.cc.o -c /root/linux/my_muduo/src/Buffer.cc

CMakeFiles/my_program.dir/Buffer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Buffer.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Buffer.cc > CMakeFiles/my_program.dir/Buffer.cc.i

CMakeFiles/my_program.dir/Buffer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Buffer.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Buffer.cc -o CMakeFiles/my_program.dir/Buffer.cc.s

CMakeFiles/my_program.dir/Channel.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Channel.cc.o: ../Channel.cc
CMakeFiles/my_program.dir/Channel.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/my_program.dir/Channel.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Channel.cc.o -MF CMakeFiles/my_program.dir/Channel.cc.o.d -o CMakeFiles/my_program.dir/Channel.cc.o -c /root/linux/my_muduo/src/Channel.cc

CMakeFiles/my_program.dir/Channel.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Channel.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Channel.cc > CMakeFiles/my_program.dir/Channel.cc.i

CMakeFiles/my_program.dir/Channel.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Channel.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Channel.cc -o CMakeFiles/my_program.dir/Channel.cc.s

CMakeFiles/my_program.dir/CurrentThread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/CurrentThread.cc.o: ../CurrentThread.cc
CMakeFiles/my_program.dir/CurrentThread.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/my_program.dir/CurrentThread.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/CurrentThread.cc.o -MF CMakeFiles/my_program.dir/CurrentThread.cc.o.d -o CMakeFiles/my_program.dir/CurrentThread.cc.o -c /root/linux/my_muduo/src/CurrentThread.cc

CMakeFiles/my_program.dir/CurrentThread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/CurrentThread.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/CurrentThread.cc > CMakeFiles/my_program.dir/CurrentThread.cc.i

CMakeFiles/my_program.dir/CurrentThread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/CurrentThread.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/CurrentThread.cc -o CMakeFiles/my_program.dir/CurrentThread.cc.s

CMakeFiles/my_program.dir/DefaultPoller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/DefaultPoller.cc.o: ../DefaultPoller.cc
CMakeFiles/my_program.dir/DefaultPoller.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/my_program.dir/DefaultPoller.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/DefaultPoller.cc.o -MF CMakeFiles/my_program.dir/DefaultPoller.cc.o.d -o CMakeFiles/my_program.dir/DefaultPoller.cc.o -c /root/linux/my_muduo/src/DefaultPoller.cc

CMakeFiles/my_program.dir/DefaultPoller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/DefaultPoller.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/DefaultPoller.cc > CMakeFiles/my_program.dir/DefaultPoller.cc.i

CMakeFiles/my_program.dir/DefaultPoller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/DefaultPoller.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/DefaultPoller.cc -o CMakeFiles/my_program.dir/DefaultPoller.cc.s

CMakeFiles/my_program.dir/EPollPoller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EPollPoller.cc.o: ../EPollPoller.cc
CMakeFiles/my_program.dir/EPollPoller.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/my_program.dir/EPollPoller.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/EPollPoller.cc.o -MF CMakeFiles/my_program.dir/EPollPoller.cc.o.d -o CMakeFiles/my_program.dir/EPollPoller.cc.o -c /root/linux/my_muduo/src/EPollPoller.cc

CMakeFiles/my_program.dir/EPollPoller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EPollPoller.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/EPollPoller.cc > CMakeFiles/my_program.dir/EPollPoller.cc.i

CMakeFiles/my_program.dir/EPollPoller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EPollPoller.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/EPollPoller.cc -o CMakeFiles/my_program.dir/EPollPoller.cc.s

CMakeFiles/my_program.dir/EventLoop.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EventLoop.cc.o: ../EventLoop.cc
CMakeFiles/my_program.dir/EventLoop.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/my_program.dir/EventLoop.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/EventLoop.cc.o -MF CMakeFiles/my_program.dir/EventLoop.cc.o.d -o CMakeFiles/my_program.dir/EventLoop.cc.o -c /root/linux/my_muduo/src/EventLoop.cc

CMakeFiles/my_program.dir/EventLoop.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EventLoop.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/EventLoop.cc > CMakeFiles/my_program.dir/EventLoop.cc.i

CMakeFiles/my_program.dir/EventLoop.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EventLoop.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/EventLoop.cc -o CMakeFiles/my_program.dir/EventLoop.cc.s

CMakeFiles/my_program.dir/EventLoopThread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EventLoopThread.cc.o: ../EventLoopThread.cc
CMakeFiles/my_program.dir/EventLoopThread.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/my_program.dir/EventLoopThread.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/EventLoopThread.cc.o -MF CMakeFiles/my_program.dir/EventLoopThread.cc.o.d -o CMakeFiles/my_program.dir/EventLoopThread.cc.o -c /root/linux/my_muduo/src/EventLoopThread.cc

CMakeFiles/my_program.dir/EventLoopThread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EventLoopThread.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/EventLoopThread.cc > CMakeFiles/my_program.dir/EventLoopThread.cc.i

CMakeFiles/my_program.dir/EventLoopThread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EventLoopThread.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/EventLoopThread.cc -o CMakeFiles/my_program.dir/EventLoopThread.cc.s

CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o: ../EventLoopThreadPool.cc
CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o -MF CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o.d -o CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o -c /root/linux/my_muduo/src/EventLoopThreadPool.cc

CMakeFiles/my_program.dir/EventLoopThreadPool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/EventLoopThreadPool.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/EventLoopThreadPool.cc > CMakeFiles/my_program.dir/EventLoopThreadPool.cc.i

CMakeFiles/my_program.dir/EventLoopThreadPool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/EventLoopThreadPool.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/EventLoopThreadPool.cc -o CMakeFiles/my_program.dir/EventLoopThreadPool.cc.s

CMakeFiles/my_program.dir/InetAddress.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/InetAddress.cc.o: ../InetAddress.cc
CMakeFiles/my_program.dir/InetAddress.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/my_program.dir/InetAddress.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/InetAddress.cc.o -MF CMakeFiles/my_program.dir/InetAddress.cc.o.d -o CMakeFiles/my_program.dir/InetAddress.cc.o -c /root/linux/my_muduo/src/InetAddress.cc

CMakeFiles/my_program.dir/InetAddress.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/InetAddress.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/InetAddress.cc > CMakeFiles/my_program.dir/InetAddress.cc.i

CMakeFiles/my_program.dir/InetAddress.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/InetAddress.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/InetAddress.cc -o CMakeFiles/my_program.dir/InetAddress.cc.s

CMakeFiles/my_program.dir/Poller.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Poller.cc.o: ../Poller.cc
CMakeFiles/my_program.dir/Poller.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/my_program.dir/Poller.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Poller.cc.o -MF CMakeFiles/my_program.dir/Poller.cc.o.d -o CMakeFiles/my_program.dir/Poller.cc.o -c /root/linux/my_muduo/src/Poller.cc

CMakeFiles/my_program.dir/Poller.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Poller.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Poller.cc > CMakeFiles/my_program.dir/Poller.cc.i

CMakeFiles/my_program.dir/Poller.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Poller.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Poller.cc -o CMakeFiles/my_program.dir/Poller.cc.s

CMakeFiles/my_program.dir/Socket.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Socket.cc.o: ../Socket.cc
CMakeFiles/my_program.dir/Socket.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/my_program.dir/Socket.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Socket.cc.o -MF CMakeFiles/my_program.dir/Socket.cc.o.d -o CMakeFiles/my_program.dir/Socket.cc.o -c /root/linux/my_muduo/src/Socket.cc

CMakeFiles/my_program.dir/Socket.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Socket.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Socket.cc > CMakeFiles/my_program.dir/Socket.cc.i

CMakeFiles/my_program.dir/Socket.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Socket.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Socket.cc -o CMakeFiles/my_program.dir/Socket.cc.s

CMakeFiles/my_program.dir/TcpConnection.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/TcpConnection.cc.o: ../TcpConnection.cc
CMakeFiles/my_program.dir/TcpConnection.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/my_program.dir/TcpConnection.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/TcpConnection.cc.o -MF CMakeFiles/my_program.dir/TcpConnection.cc.o.d -o CMakeFiles/my_program.dir/TcpConnection.cc.o -c /root/linux/my_muduo/src/TcpConnection.cc

CMakeFiles/my_program.dir/TcpConnection.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/TcpConnection.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/TcpConnection.cc > CMakeFiles/my_program.dir/TcpConnection.cc.i

CMakeFiles/my_program.dir/TcpConnection.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/TcpConnection.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/TcpConnection.cc -o CMakeFiles/my_program.dir/TcpConnection.cc.s

CMakeFiles/my_program.dir/TcpServer.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/TcpServer.cc.o: ../TcpServer.cc
CMakeFiles/my_program.dir/TcpServer.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/my_program.dir/TcpServer.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/TcpServer.cc.o -MF CMakeFiles/my_program.dir/TcpServer.cc.o.d -o CMakeFiles/my_program.dir/TcpServer.cc.o -c /root/linux/my_muduo/src/TcpServer.cc

CMakeFiles/my_program.dir/TcpServer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/TcpServer.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/TcpServer.cc > CMakeFiles/my_program.dir/TcpServer.cc.i

CMakeFiles/my_program.dir/TcpServer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/TcpServer.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/TcpServer.cc -o CMakeFiles/my_program.dir/TcpServer.cc.s

CMakeFiles/my_program.dir/Thread.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Thread.cc.o: ../Thread.cc
CMakeFiles/my_program.dir/Thread.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/my_program.dir/Thread.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Thread.cc.o -MF CMakeFiles/my_program.dir/Thread.cc.o.d -o CMakeFiles/my_program.dir/Thread.cc.o -c /root/linux/my_muduo/src/Thread.cc

CMakeFiles/my_program.dir/Thread.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Thread.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Thread.cc > CMakeFiles/my_program.dir/Thread.cc.i

CMakeFiles/my_program.dir/Thread.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Thread.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Thread.cc -o CMakeFiles/my_program.dir/Thread.cc.s

CMakeFiles/my_program.dir/Timestamp.cc.o: CMakeFiles/my_program.dir/flags.make
CMakeFiles/my_program.dir/Timestamp.cc.o: ../Timestamp.cc
CMakeFiles/my_program.dir/Timestamp.cc.o: CMakeFiles/my_program.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/my_program.dir/Timestamp.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_program.dir/Timestamp.cc.o -MF CMakeFiles/my_program.dir/Timestamp.cc.o.d -o CMakeFiles/my_program.dir/Timestamp.cc.o -c /root/linux/my_muduo/src/Timestamp.cc

CMakeFiles/my_program.dir/Timestamp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_program.dir/Timestamp.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/linux/my_muduo/src/Timestamp.cc > CMakeFiles/my_program.dir/Timestamp.cc.i

CMakeFiles/my_program.dir/Timestamp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_program.dir/Timestamp.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/linux/my_muduo/src/Timestamp.cc -o CMakeFiles/my_program.dir/Timestamp.cc.s

# Object files for target my_program
my_program_OBJECTS = \
"CMakeFiles/my_program.dir/Acceptor.cc.o" \
"CMakeFiles/my_program.dir/Buffer.cc.o" \
"CMakeFiles/my_program.dir/Channel.cc.o" \
"CMakeFiles/my_program.dir/CurrentThread.cc.o" \
"CMakeFiles/my_program.dir/DefaultPoller.cc.o" \
"CMakeFiles/my_program.dir/EPollPoller.cc.o" \
"CMakeFiles/my_program.dir/EventLoop.cc.o" \
"CMakeFiles/my_program.dir/EventLoopThread.cc.o" \
"CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o" \
"CMakeFiles/my_program.dir/InetAddress.cc.o" \
"CMakeFiles/my_program.dir/Poller.cc.o" \
"CMakeFiles/my_program.dir/Socket.cc.o" \
"CMakeFiles/my_program.dir/TcpConnection.cc.o" \
"CMakeFiles/my_program.dir/TcpServer.cc.o" \
"CMakeFiles/my_program.dir/Thread.cc.o" \
"CMakeFiles/my_program.dir/Timestamp.cc.o"

# External object files for target my_program
my_program_EXTERNAL_OBJECTS =

my_program: CMakeFiles/my_program.dir/Acceptor.cc.o
my_program: CMakeFiles/my_program.dir/Buffer.cc.o
my_program: CMakeFiles/my_program.dir/Channel.cc.o
my_program: CMakeFiles/my_program.dir/CurrentThread.cc.o
my_program: CMakeFiles/my_program.dir/DefaultPoller.cc.o
my_program: CMakeFiles/my_program.dir/EPollPoller.cc.o
my_program: CMakeFiles/my_program.dir/EventLoop.cc.o
my_program: CMakeFiles/my_program.dir/EventLoopThread.cc.o
my_program: CMakeFiles/my_program.dir/EventLoopThreadPool.cc.o
my_program: CMakeFiles/my_program.dir/InetAddress.cc.o
my_program: CMakeFiles/my_program.dir/Poller.cc.o
my_program: CMakeFiles/my_program.dir/Socket.cc.o
my_program: CMakeFiles/my_program.dir/TcpConnection.cc.o
my_program: CMakeFiles/my_program.dir/TcpServer.cc.o
my_program: CMakeFiles/my_program.dir/Thread.cc.o
my_program: CMakeFiles/my_program.dir/Timestamp.cc.o
my_program: CMakeFiles/my_program.dir/build.make
my_program: CMakeFiles/my_program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/linux/my_muduo/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking CXX executable my_program"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_program.dir/build: my_program
.PHONY : CMakeFiles/my_program.dir/build

CMakeFiles/my_program.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_program.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_program.dir/clean

CMakeFiles/my_program.dir/depend:
	cd /root/linux/my_muduo/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/linux/my_muduo/src /root/linux/my_muduo/src /root/linux/my_muduo/src/build /root/linux/my_muduo/src/build /root/linux/my_muduo/src/build/CMakeFiles/my_program.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_program.dir/depend

