class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.246"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.246/workmux-darwin-arm64.tar.gz"
      sha256 "57cb13501807b1a3c45076881d0e994f6ab4d5ef802838a93e5213f2c3e4d17c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.246/workmux-darwin-amd64.tar.gz"
      sha256 "67b26978f9db6018e707df66f5a279483a489e2d97597f29a6583d383601689e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.246/workmux-linux-arm64.tar.gz"
      sha256 "2f116d2823fe87f29cf17a0e287afa0fcb25936fde651f90dfdd16d5b9918ba2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.246/workmux-linux-amd64.tar.gz"
      sha256 "f0d774ea79db14afb85f7384151d3f70d55c59f1356c7d6060f5a220817a0d5d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
