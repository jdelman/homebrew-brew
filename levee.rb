class Levee < Formula
	homepage "https://github.com/imgix/levee"

	url "https://github.com/imgix/levee/archive/v0.3.1.tar.gz"
	sha256 "b85d3258750d2b8292c875774c56e049b7611c278053430a238fb0f8ca3d1898"

  keg_only :provided_by_osx
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
