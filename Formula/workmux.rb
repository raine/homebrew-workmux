class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.52/aarch64-apple-darwin.tar.gz"
      sha256 "c58a517c20469faec447243540e80650d5c1f4b75f80b7a2bf2f3a5f2a411130"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.52/x86_64-apple-darwin.tar.gz"
      sha256 "37bb7df1f7e0d78a3574af2518dab987c84dde3ce71b371d7cb3186cce04bba0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.52/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e699f28ebf3ab0e77b8dbbd1a5b30121d984003ba24c0962a33b908559c88af"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.52/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e51dec5dee1bbd91475f7a6173d298dfb01324f889de33864c42135b47e2df68"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
