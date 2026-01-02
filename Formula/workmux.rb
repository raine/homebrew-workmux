class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.64/workmux-darwin-arm64.tar.gz"
      sha256 "d5721362b7c915ee5d557f88b807974e44c88706e69d6d64eaf660230690950b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.64/workmux-darwin-amd64.tar.gz"
      sha256 "7bcc08fec058a8d75eab3f75b85c4a62f4105f352d6ab60f99f9aeafa4b3ea6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.64/workmux-linux-arm64.tar.gz"
      sha256 "84059ae7757729b3a15ca07c7fadea9f34e9b673c46c550e4952df4efa8ea20e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.64/workmux-linux-amd64.tar.gz"
      sha256 "ec28fd3d00d9ef0895e256fb413ff286a83bf696a857d984abc22989271f4a2f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
