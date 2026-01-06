class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.71"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.71/workmux-darwin-arm64.tar.gz"
      sha256 "18f5b2b3627a94d38be4e41edc1ceab516377ffffee8388d4f101f6a74c84d2e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.71/workmux-darwin-amd64.tar.gz"
      sha256 "7d805ad56f1579a6e55902b3e84f6e66ead7802a3fde31a66abccbe178f70b36"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.71/workmux-linux-arm64.tar.gz"
      sha256 "f5b9e88df438969030e9e4effa9113b01e237a974805c7f5e4424e21b01a28a0"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.71/workmux-linux-amd64.tar.gz"
      sha256 "5b9c419d2abc1613de36af289dfeedd36f925e25b61158d35a97d3b5568ae22b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
