class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.156"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.156/workmux-darwin-arm64.tar.gz"
      sha256 "b4b7bb549e76e3f1420d4989c08f2b63812d1b0a649b2f115aecdcc9df9a1929"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.156/workmux-darwin-amd64.tar.gz"
      sha256 "f1e3ea0490bc84a075765817d24879dc3637b01b5fe30e670d5a6fea3f123bec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.156/workmux-linux-arm64.tar.gz"
      sha256 "18e315ee9c5d22a427b7dd3b0b6c731473f40076ecb127dd90fd7a1a7dcc6d2f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.156/workmux-linux-amd64.tar.gz"
      sha256 "aea00ea94912708a686839bb1fbe25a8baddd355c6b8e9c9c1b1f52d8d0cf0b9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
