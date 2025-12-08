class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.45/aarch64-apple-darwin.tar.gz"
      sha256 "1c1b7cc83e8fa5250ca90b0fb0e8cb41d67fb44b1d45849c2bfc50764725a52a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.45/x86_64-apple-darwin.tar.gz"
      sha256 "9ac7fcbacaa2bc31e5d899d38ca5af68475ff56fccabf9aaa4f64099c91696bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.45/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb7204d919a278b0ea8ba9654bd105a0d21a58d3b912dfd3bbcc7fd2cb770852"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.45/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3b861e33bd8ffe864fdf7b7ba0a35c098c26d793167278b1388a7a13f4bb319"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
