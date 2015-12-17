class Libsiphon < Formula
	homepage "https://github.com/imgix/siphon"

	url "https://github.com/imgix/siphon/archive/v0.2.2.tar.gz"
	sha256 "c1503dbbc2d43029850ac0bda0e6ce670f43e86fd85a8ac87448e37064bdc8bc"

  depends_on "cmake" => :build
  depends_on "ragel" => :build

  head do
    url "https://github.com/imgix/siphon.git"
  end

  def install
    #args = std_cmake_args
    args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_INSTALL_PREFIX=#{prefix}
      -DCMAKE_INSTALL_NAME_DIR=#{prefix}
    ]
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
