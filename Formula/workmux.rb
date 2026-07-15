class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.222"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.222/workmux-darwin-arm64.tar.gz"
      sha256 "e01ecdf1c4c9ef18e3cbdc76bad64077db1056481e8e66bf790795955f6389ed"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.222/workmux-darwin-amd64.tar.gz"
      sha256 "ab942048fdf7c9864111a12477c6dd14982d7b5b0b2e23029a391e0a16ddea48"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.222/workmux-linux-arm64.tar.gz"
      sha256 "cfe88831606f07c5eca21de3e557de3e323d023b0712a7d2ef6713f9b7b3d219"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.222/workmux-linux-amd64.tar.gz"
      sha256 "ff81faa58a70b8fc0ed51a10e5efe85d4b1a706d4054f47965b1caf8bf957a9d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
