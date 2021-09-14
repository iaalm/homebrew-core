class Xchm < Formula
  desc "Frontend for CHMLIB"
  homepage "https://github.com/rzvncj/xCHM"
  url "https://github.com/rzvncj/xCHM/archive/refs/tags/1.32.tar.gz"
  sha256 "c0363049d8b4f69ef5d02a82f9d94c321a4d34dc013c84c28a43240f71fdf8a5"
  license "GPL-2.0-only"

  depends_on "autoconf" => :build
  depends_on "gettext" => :build
  depends_on "chmlib"
  depends_on "wxwidgets"

  def install
    system "autoreconf", "--install"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    s = pipe_output("#{bin}/xchm -h 2>&1")
    assert_includes s, "Usage: xchm"
  end
end
