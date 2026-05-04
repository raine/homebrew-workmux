class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.200"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.200/workmux-darwin-arm64.tar.gz"
      sha256 "6b09d6c6573105d7f434e680685b69b096adadb38d51be9e28578600593656f4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.200/workmux-darwin-amd64.tar.gz"
      sha256 "d8ed96343533c5f0c25bf75c4f51b39073a2749311069a15d2d53aed293e9aea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.200/workmux-linux-arm64.tar.gz"
      sha256 "0a97865a76ab0af8ea08055bc7fbd9f091a314a2f312fc98f16d916eb2b39730"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.200/workmux-linux-amd64.tar.gz"
      sha256 "281c9fa51301b2ff40f5acac296673d0a3bffe036827f3fd912a94e536618c82"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
