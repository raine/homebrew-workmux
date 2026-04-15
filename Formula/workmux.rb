class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.183"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.183/workmux-darwin-arm64.tar.gz"
      sha256 "64896e57fc67d63fb65f4f7026deb0c89ec9cfcec70ca7fcc24d8c3402d99cb5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.183/workmux-darwin-amd64.tar.gz"
      sha256 "18e6b46797aef736b6b3589f62fa46af7fcb08dcc76a0947482108935f2a4b06"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.183/workmux-linux-arm64.tar.gz"
      sha256 "63061e94f1e0d4f23935ed4171002343674b6ae0460e4d66112a0d36ddda7bcc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.183/workmux-linux-amd64.tar.gz"
      sha256 "1b73ad5623c22a79eeef1d9945782791f38e752cadd86bab46ad413cd34b894d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
