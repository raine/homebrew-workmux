class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.109"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.109/workmux-darwin-arm64.tar.gz"
      sha256 "01734710fba74301fec5707c7ab51d90d1cdee29d17fd1940025006ad4f12348"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.109/workmux-darwin-amd64.tar.gz"
      sha256 "e2c10c44fc80856acaa1e300432f6dcd90fe91242d56df379d24ce076ec7fda2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.109/workmux-linux-arm64.tar.gz"
      sha256 "06960067a8592f5745b7e1a6ca16f5a2a887b240610c488dd4e555f3cada05b7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.109/workmux-linux-amd64.tar.gz"
      sha256 "d18f9a4e8639992daa4603b96bdc3f81a2ed7ed99430cc05fd534a3dc9ef5251"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
