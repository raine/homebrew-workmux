class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.198"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.198/workmux-darwin-arm64.tar.gz"
      sha256 "39e7938d2e8aecefc0a7dd1845559d58d241f923970a176859a8a175caa2fd86"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.198/workmux-darwin-amd64.tar.gz"
      sha256 "1792f0c842ea142e3e39735445e3b2e0cb355b15208363d62c70351bb84941a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.198/workmux-linux-arm64.tar.gz"
      sha256 "cd98afc6aa7c1eb633c9038a492ec6a4589c8ea08254d5ed46a8a923bf724cb8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.198/workmux-linux-amd64.tar.gz"
      sha256 "17ce974c0f7b5f983f1d861dbb9dad8cdeb3213de4e95d2672d319e22f9958a1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
