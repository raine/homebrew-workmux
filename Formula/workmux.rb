class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.223"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.223/workmux-darwin-arm64.tar.gz"
      sha256 "61418a7c5d3ddfbd7a4a35948d3a31567349d03cc62554bd114c77c46755cd2d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.223/workmux-darwin-amd64.tar.gz"
      sha256 "a8849d07441a37fb3d598c5fceb886168995a592aec002014feb6f4355eb9710"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.223/workmux-linux-arm64.tar.gz"
      sha256 "e43ad19a5cd81e140db819ba5524957b7d584fd6026489c2bfe5f1d6d75cac8b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.223/workmux-linux-amd64.tar.gz"
      sha256 "1d3c62cf9f869c7a9d64171a41456fa89ec347bc23b0fd05c259a0dedffd40bd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
