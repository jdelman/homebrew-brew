class Libsiphon < Formula
	homepage "https://github.com/imgix/siphon"

	url "https://github.com/imgix/siphon/archive/v0.2.1.tar.gz"
	sha256 "ee69ad3e122b5817d095edbe845bf6bafa6613299c6360ae0f1778ec4058c139"

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
