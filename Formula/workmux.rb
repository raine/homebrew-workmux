class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.62/aarch64-apple-darwin.tar.gz"
      sha256 "9f0d6cbc7e0f1e978e197e5f83d5024a6e43a3791fd41c8ffbed7712672e393a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.62/x86_64-apple-darwin.tar.gz"
      sha256 "6cf6d9c18a1ebb1cfe26673773a6948a3cf32363c3dd449b7ccc50ad69e0ddae"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.62/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11f25e6bac885c040e316cbe0fcdf558c48d1cffe3a98154be45b0895fdd06c7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.62/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efc3b90aec296e958235d643cb0b17f69aa162f37bf8e00205cb9a7ed4870943"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
