class Libsiphon < Formula
	homepage "https://github.com/imgix/siphon"

  url "https://github.com/imgix/siphon/archive/v0.2.2.tar.gz"
  sha256 "43cd29621d85a0425ddfccc20d97a56232b650b988cb660302d9cd54cb84b71d"

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
