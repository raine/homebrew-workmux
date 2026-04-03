class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.175"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.175/workmux-darwin-arm64.tar.gz"
      sha256 "249b966a9b09383d46265ddf8208f7134fe66163ebe7f7359450a3b1a71f1243"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.175/workmux-darwin-amd64.tar.gz"
      sha256 "379a5b1c5baeaf131db0cce056b1a6ccbc5b4aa6418f38b3ab3800606214781f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.175/workmux-linux-arm64.tar.gz"
      sha256 "8dfaf95b33fb80a50d18c8a942e48d760c270a23cd71361b097d816a60ec343e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.175/workmux-linux-amd64.tar.gz"
      sha256 "133dda1d46d11de5b6439f286dfa33217ad24905dd445a41d1f4ecc9cb8b3a06"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
