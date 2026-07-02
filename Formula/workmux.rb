class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.217"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-darwin-arm64.tar.gz"
      sha256 "6c10cbe74adc3b230a011d60ffb9eeb191bb1826192b0d6d7ef9d6c98a263e58"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-darwin-amd64.tar.gz"
      sha256 "9bc40ba4174f5f65e463965b9f27e7d2c6aa6bd8e6870807f03ef0372444edf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-linux-arm64.tar.gz"
      sha256 "6a2fba7f3692d90d8886cef7e3ea1be447edd6bb64ace39ee00645d834612c24"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.217/workmux-linux-amd64.tar.gz"
      sha256 "06e1997aebe11e6f034e5e5bf9b2b5999c1c4eccfaa0c754de5aab09ffd050c1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
