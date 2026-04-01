class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.169"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.169/workmux-darwin-arm64.tar.gz"
      sha256 "ae5035ad81d0f73246f9578a227e3141bf1bb3743d0a3f318a47d15108cba991"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.169/workmux-darwin-amd64.tar.gz"
      sha256 "409f9c58e34bbee9b913e17f7b0dc57683fd7f350f843822806aeb667090669d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.169/workmux-linux-arm64.tar.gz"
      sha256 "eb99ce26d47a407ccf47acf89e59cbaf59f098b78542729aaa325f31866c5d06"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.169/workmux-linux-amd64.tar.gz"
      sha256 "0436c41d20d8a2ac0127210242972cc8f7ac8c13c050c76d5174164c0437dfdc"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
