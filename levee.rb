class Levee < Formula
	homepage "https://github.com/imgix/levee"

	url "https://github.com/imgix/levee/archive/v0.3.3.tar.gz"
	sha256 "1ll0qzhimmjxbv37ir7kfx0sm46dwlxhycilfxrp2ql45iy4dag1"

  depends_on "cmake" => :build
  depends_on "ragel" => :build

  head do
    url "https://github.com/imgix/levee.git"
  end

  def install
    #args = std_cmake_args
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_INSTALL_PREFIX=#{prefix}
    ]
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
