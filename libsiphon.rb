class Libsiphon < Formula
	homepage "https://github.com/imgix/siphon"

	url "https://github.com/imgix/siphon/archive/v0.2.2.tar.gz"
	sha256 "38d0e5fc1ab57271a66a8f7674b9aa429d6351ad2f30eedaf2e3f8906048ac34"

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
