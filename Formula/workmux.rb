class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.229"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.229/workmux-darwin-arm64.tar.gz"
      sha256 "a994831e5b6f6ab127aea5d33d2d3fd56a52c18ae49d2386ca8a2683ac2694ec"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.229/workmux-darwin-amd64.tar.gz"
      sha256 "0f3cc7e2b4dd133703086eb1a056bd5a72b6b0281d427480b883603dd511f1cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.229/workmux-linux-arm64.tar.gz"
      sha256 "21a4c1ffee59446e92fb1c2be53858c5bab0f2fca0e9a10e73fdd8d983f3dea7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.229/workmux-linux-amd64.tar.gz"
      sha256 "b81fc29663ab10f9cdd9b623e6a115553dd50268e3a6ae3f4316fa6e3bbdce5c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
