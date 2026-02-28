class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.125"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.125/workmux-darwin-arm64.tar.gz"
      sha256 "c31df31dd4b2e5c1ac53c0cb41318e8955ee0138959678a412314b50c0284c8b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.125/workmux-darwin-amd64.tar.gz"
      sha256 "f0c714c9c22b373794dbda4f6c89bf9598e5e844885a4668441fd9565dac5871"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.125/workmux-linux-arm64.tar.gz"
      sha256 "5e984dbd19007b31aa292632814fa6ec5fd0ad3583f23040e8ba5e40f20f7865"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.125/workmux-linux-amd64.tar.gz"
      sha256 "9f59caedfa3e177f0225bd38b1af2cc804fc1ba408088bed5f9d712b1e0707a0"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
