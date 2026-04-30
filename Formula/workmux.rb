class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.193"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.193/workmux-darwin-arm64.tar.gz"
      sha256 "6dc9508bd99d07dfcbc4c14e4baff014e68ca4ec58f12ef4208c58198c2152e1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.193/workmux-darwin-amd64.tar.gz"
      sha256 "888e9455e15adc0ad01facbeabda471737fad287ba0421f2b683177661d61f20"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.193/workmux-linux-arm64.tar.gz"
      sha256 "f6ebf96928e0c80b959dec7e6f3f98367ebf7e343595c38cd927c3b75b0d0402"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.193/workmux-linux-amd64.tar.gz"
      sha256 "7a3c3077f0a662715e7c24f9a39ca30b9f82c28a01b747b570d02264c90c2c44"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
