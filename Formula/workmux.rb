class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.189"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.189/workmux-darwin-arm64.tar.gz"
      sha256 "d5191ea88d93c89d580c6a34d9d95e82ac992fd42837286eb8b42f0c26c5066b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.189/workmux-darwin-amd64.tar.gz"
      sha256 "25538871fbb7388088c770d1dcf5e4c5d4227102507508ba1e8aa170b9db7e07"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.189/workmux-linux-arm64.tar.gz"
      sha256 "026756c113ec02fb97606511471ead840aa1405348cb38ca60b0b06f10b3edd9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.189/workmux-linux-amd64.tar.gz"
      sha256 "313f0e6f7f473d5d0b34c8447ce9870a65e13a1744883d7c3828746ea4c99c46"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
