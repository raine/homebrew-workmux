class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.177"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.177/workmux-darwin-arm64.tar.gz"
      sha256 "f8867b482ffc1b7a8ef6ec136111d943735e69ae72ff0541933b6c2f688ed37d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.177/workmux-darwin-amd64.tar.gz"
      sha256 "7e88934b22ca0aac3164d299b275379cfc07275203690c85869b2d24c7126cb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.177/workmux-linux-arm64.tar.gz"
      sha256 "298e38ba80b8cd481629bad3511b9cdcca685a0aeb71b2754201d701be3b9c03"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.177/workmux-linux-amd64.tar.gz"
      sha256 "273067dce68ccfa4fcce5c6fbb91e6f00f5f23c70fb8def952e47a626487620f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
