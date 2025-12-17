class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.54/aarch64-apple-darwin.tar.gz"
      sha256 "a6941632b9729bc4cdbcc54ada98ad2e517f41fa7212a1b23f049af1bc921390"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.54/x86_64-apple-darwin.tar.gz"
      sha256 "abf8bca160faf0c42619580bfcaec3bc2afaa2653f0632248726796f1d5090f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.54/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "787b78c8bbc78c6e1499d10555ef31cb2d16e4ebfd754194aabc807cca0aeede"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.54/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f540637c9d88670cd5c2c2a5ad31d437a1643da2cbee606353467bbf314cb6d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
