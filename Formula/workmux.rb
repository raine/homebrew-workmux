class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.94"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.94/workmux-darwin-arm64.tar.gz"
      sha256 "bdaa6e27b7fca4e37b31c7992a7d17bad9e11d2c91a50a048e1b4a0c24c1fd08"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.94/workmux-darwin-amd64.tar.gz"
      sha256 "325e2748495c3046aef18470cd7233e9c10f667acfba60d0a4a86571b3ba76e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.94/workmux-linux-arm64.tar.gz"
      sha256 "aa55b4e8b4528aaf68da9f5277034c79fd897182e3c16fc555dbc1dbdfdb66be"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.94/workmux-linux-amd64.tar.gz"
      sha256 "b99ab7e6b015b7fc1cb3a869dddf638224434dcfee9e262cb4a668ef8a17f4ab"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
