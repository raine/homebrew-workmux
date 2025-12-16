class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.51/aarch64-apple-darwin.tar.gz"
      sha256 "62245cd5e466c89942924d6dce7939da8a68d5e4c99c1bd2587bba4251a0caf6"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.51/x86_64-apple-darwin.tar.gz"
      sha256 "da1ec49feb5e11ab77d971d9891f37ae158b6b730a06e8113f3a622405efbc72"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.51/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bd755b9cce3d0384abab45f1ade920dc6a007a9d5a95a7d32174bd114a7ae90"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.51/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b73be1e766572b7aa54574074d8568f28634923a6ca30a0f250d168b0ef710be"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
