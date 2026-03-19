class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.141"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.141/workmux-darwin-arm64.tar.gz"
      sha256 "2cc15009fa030577a07940bbb8dc018386799464e9a52fb762c5b7e5fac1b2c1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.141/workmux-darwin-amd64.tar.gz"
      sha256 "3f1719e547fa4b9509618292fcdbcab043cf2bd1d715855288a9f908db9a698f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.141/workmux-linux-arm64.tar.gz"
      sha256 "251207a7c7d9f06801f3dda5f88979788362a710f2d1d2548362fedb971e7a09"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.141/workmux-linux-amd64.tar.gz"
      sha256 "24e307c9f460ba10df8ba170e4e6d7aeaaebf93fc5151bc5dedec83f24c96951"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
