class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.143"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.143/workmux-darwin-arm64.tar.gz"
      sha256 "727ed1ced4dd7421b454841c0f0b171f0bc9df076e27ad0cbcbeccca328c06fb"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.143/workmux-darwin-amd64.tar.gz"
      sha256 "03ff1d1072518112f711fdea9ef07306d060117e9a1d5b8d859c41cbc6919dcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.143/workmux-linux-arm64.tar.gz"
      sha256 "56430feee85432e9b8864a68bc29602e47cd58f6b18eb51cb31e699b4fe00d1b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.143/workmux-linux-amd64.tar.gz"
      sha256 "0888b4aa376cbc25ff731c1d80ed35cc24633d0d36c1b2dbe7a2a897a441ddec"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
