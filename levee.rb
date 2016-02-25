class Levee < Formula
	homepage "https://github.com/imgix/levee"

	url "https://github.com/imgix/levee/archive/v0.3.2.tar.gz"
	sha256 "e8415d9bb91886c695211aa0afaead44b77548220e82df98aab31c6e5739e4c1"

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
