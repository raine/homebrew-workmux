class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.158"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.158/workmux-darwin-arm64.tar.gz"
      sha256 "80fb012bfc7f964ffd1c3a3e99a085980ed57d811edddf8dea6eda50205b40ce"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.158/workmux-darwin-amd64.tar.gz"
      sha256 "faca5b73097c5885317480e8b8e0231a1800ab70b7b9f5eb7f8607e59a8fe428"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.158/workmux-linux-arm64.tar.gz"
      sha256 "a579071c42ed9bf4843221eafd67505b5c4cc5f1609e9e122ba9973c9b7a0982"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.158/workmux-linux-amd64.tar.gz"
      sha256 "cdf4b3e18dd272b75e6342365aaf362470067f020ef84176fd1c5fd0aa054ef7"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
