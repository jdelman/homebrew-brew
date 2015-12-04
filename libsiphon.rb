class Levee < Formula
	homepage "https://github.com/imgix/siphon"

	url "https://github.com/imgix/siphon/archive/v0.2.0.tar.gz"
	sha256 "c2fa97d6550ca8327a6d39de7c1e440f384c024c905ec8a6cb013b1345cf4ff5"

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
