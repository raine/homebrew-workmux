class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.173"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.173/workmux-darwin-arm64.tar.gz"
      sha256 "b21744460a442653fc67547461cd0daabd9425131d8af8a034aa2226622c90de"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.173/workmux-darwin-amd64.tar.gz"
      sha256 "1470f2dde1c27158fa477d5b4a3681d3f0cde767ee0af9d095627a5e7abe303b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.173/workmux-linux-arm64.tar.gz"
      sha256 "ea708603dc6ec249baf26ba46e5dab1ffdbd21956e76d02ff28eecae9b457903"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.173/workmux-linux-amd64.tar.gz"
      sha256 "64b3aea25aa72c8ffb4bd850d3dc711ba9aa11f879e434b8126c8378cd113427"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
