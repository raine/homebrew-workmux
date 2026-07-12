class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.220"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.220/workmux-darwin-arm64.tar.gz"
      sha256 "5833f67fc493a03491938d61a986031caf821d9b26f5f6b7483c447cc422f48c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.220/workmux-darwin-amd64.tar.gz"
      sha256 "31ff49c962f62ff754f73c7a0928a7fcc1cf73861f8a017b79d06953aa2869fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.220/workmux-linux-arm64.tar.gz"
      sha256 "642a7b219ff2896a1af075a7f3dadd19acd2ef5637e728cdf47435a973532e69"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.220/workmux-linux-amd64.tar.gz"
      sha256 "5c1ef4ef60cd2d2d6afed12ebd2e8c631de66e81489cd69e62161e37d565e9c3"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
