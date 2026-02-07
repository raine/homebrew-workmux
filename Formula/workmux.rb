class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.108"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-darwin-arm64.tar.gz"
      sha256 "506664a8531c77fa469c142e5f74ed885d2fe581c379d6ccce7ecd007d7823c1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-darwin-amd64.tar.gz"
      sha256 "e0d8978f44568d607ed9ac22e0e4feedbc1af137e07933007e292bd85dd02e94"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-linux-arm64.tar.gz"
      sha256 "a05238d91ef7de1db9d3cf91bbd21efc891969bde0d01c32ba791ba5c02a5f95"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.108/workmux-linux-amd64.tar.gz"
      sha256 "bef8c18dfc026c880c4862c5b87d8d5120564de4acac3650929d91a9d1d1a4ee"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
