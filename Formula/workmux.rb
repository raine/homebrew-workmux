class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.31/aarch64-apple-darwin.tar.gz"
      sha256 "4d96bb594b845e2244bdac8371b57601d6fc441f4af13589b83c2cf151d36611"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.31/x86_64-apple-darwin.tar.gz"
      sha256 "bb5f6a0031601da45658d562fb75bf84f2fca93f13d77f4dc89ce6208d4252b2"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.31/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f980d29e778f3c6912531589a0e84713d25c4cd67073f2a56e6d60d51de4517"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
