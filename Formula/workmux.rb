class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.228"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.228/workmux-darwin-arm64.tar.gz"
      sha256 "b927d285fd3404cfbf70bb5dbc697c1e4a4df44ac67d426bc4cbd0ac095b338b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.228/workmux-darwin-amd64.tar.gz"
      sha256 "5e0ab4976ef6c5623a2ec63e55939fc8c3091d39adc63d4d6e153dd24fb15b5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.228/workmux-linux-arm64.tar.gz"
      sha256 "bdf5e013aeee8808b1034c7d3b6d723af62790d2d557500b0fadf4d2e8221f55"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.228/workmux-linux-amd64.tar.gz"
      sha256 "ea92f2b09b6e65afbd2c28b73acd354c6d32a1437b96b91b99e8cfc811b8fa6f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
