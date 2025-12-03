class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.41/aarch64-apple-darwin.tar.gz"
      sha256 "9bca143ab2f594252ab2ad2d5b7a69df208f450d407865928cc3ff34d74b5b60"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.41/x86_64-apple-darwin.tar.gz"
      sha256 "c399c0a476f293ea22b54bfe47497f84652e9f135beb1826c7fd19182bf875d1"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.41/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7281d9d1a85b2d34cf4b8b6751930e1cc000068fac62bc7341321d5625eb36d2"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
