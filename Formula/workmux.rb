class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.140"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.140/workmux-darwin-arm64.tar.gz"
      sha256 "ebed1429022136cf3cbe9377ad22daac2118c57b10e0eafac3b05fbda8d71a32"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.140/workmux-darwin-amd64.tar.gz"
      sha256 "26563aafd159cde5fa83c0698ceb3c1c82c3ab3bf6f733e0d61b92dca6f96ac1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.140/workmux-linux-arm64.tar.gz"
      sha256 "d8623c2e1708048a6af40c6ccaad224666bd224358e6b0c8cb6b21b0c72f59ba"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.140/workmux-linux-amd64.tar.gz"
      sha256 "c8a32b28f375f0959b09aab3febdeb22a3e6798e7fbb5529bebe0f46d5a17ea2"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
