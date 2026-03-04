class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.130"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.130/workmux-darwin-arm64.tar.gz"
      sha256 "aacd740e6ed6ad7192c7d1928491f6359b980fdec81ae82ef95260b448dd9ce2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.130/workmux-darwin-amd64.tar.gz"
      sha256 "3e9db23ff830fd20466b0dca5d2e2a6024339df7281a9e11449fd8b71ac0f055"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.130/workmux-linux-arm64.tar.gz"
      sha256 "a99c85c5071c1d5ec6f22fefb9ab5f56242561b07b1ca250b388fb9263d93a29"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.130/workmux-linux-amd64.tar.gz"
      sha256 "66644826c75c19905ccbdabd2aa3272dbc2273397e5de5ef4dbe355f3af71bfa"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
