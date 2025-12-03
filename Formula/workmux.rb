class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.37/aarch64-apple-darwin.tar.gz"
      sha256 "6b60b092d7be4b90e79aa1ee39dc8c9a8ade3e359c50eef7ebadd3f6b6e607a3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.37/x86_64-apple-darwin.tar.gz"
      sha256 "c9ccb355aa7c0b788d243655ef7742b5c92547c7c403e8d78d0c6a8d4dd3cc01"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.37/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "be5e8482ee1cc373866865ddc91baf6eb8f19477c0fbe76e0f5751dadb83d0a4"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
