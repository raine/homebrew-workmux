class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.138"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.138/workmux-darwin-arm64.tar.gz"
      sha256 "ea75daf8e4ffa3fecac8d594b388249f8687184f15cbe49e2a43aa7feb4155e8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.138/workmux-darwin-amd64.tar.gz"
      sha256 "cec7a8b5de659c371384aa366d76f136cbedb0ed931fd3d61b107d16b6c37702"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.138/workmux-linux-arm64.tar.gz"
      sha256 "574bad34b4276150f4141653aea97303864de542222cf6472a2be1ac27547c89"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.138/workmux-linux-amd64.tar.gz"
      sha256 "b73de68d817a881a29e53ce1d156822bb2934b019f8277cd47dfce65b249c5a5"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
