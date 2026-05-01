class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.196"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.196/workmux-darwin-arm64.tar.gz"
      sha256 "1548ef71ef09fa13966954e4dda37049b2d332c444e2a551b2787bcc184004bd"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.196/workmux-darwin-amd64.tar.gz"
      sha256 "fc9feefd42353a38566bb7a7bcd79b9353adfb5cdf1156a575e35542a500ce8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.196/workmux-linux-arm64.tar.gz"
      sha256 "7f9919b4a47d9ca8bce2e6cafdd921d8d0abc3b70c393e2604a46d2707d03951"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.196/workmux-linux-amd64.tar.gz"
      sha256 "e59b70e25fe3de0013c7ad5f1b5ecfe9e9ad8e42db214a1eba77e5e066268c80"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
