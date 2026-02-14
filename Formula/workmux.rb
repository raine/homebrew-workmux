class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.113"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.113/workmux-darwin-arm64.tar.gz"
      sha256 "ae1486c1aca06b961a3ea0c272c26e5a0cd9a087ce9a80c8c07a5221f29ba88f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.113/workmux-darwin-amd64.tar.gz"
      sha256 "39b08f4c87dc6b8b377077c4b03ad557251355350c705886bd45265c9a89c962"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.113/workmux-linux-arm64.tar.gz"
      sha256 "c2a3fb2e07975e33fb03856631a4c32fdec33aecf156aa8fc2589c89218eff96"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.113/workmux-linux-amd64.tar.gz"
      sha256 "0d3a72bb844657555cb507bf13ed9164a253d1a88a53f380bc6779999dcd7f4a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
