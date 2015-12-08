class Libsiphon < Formula
	homepage "https://github.com/imgix/siphon"

	url "https://github.com/imgix/siphon/archive/v0.2.0.tar.gz"
	sha256 "52f0d832841eef944c7f02be1ad2d0607121d09d145e6cec4fe64e98c16cdc3c"

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
