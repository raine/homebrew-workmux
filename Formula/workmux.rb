class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.207"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.207/workmux-darwin-arm64.tar.gz"
      sha256 "db621299b66f640f6be5e5ba53d75ffbcbb6ebdf87013d2f811935bde6d5e499"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.207/workmux-darwin-amd64.tar.gz"
      sha256 "e22cfcf71420edde600cf594ebecf9b7899890fd3d3d0977673055994f656b2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.207/workmux-linux-arm64.tar.gz"
      sha256 "996def3f5596ea1504fa4ca0f93cef9c7b72d671841fca971b3c0388bc6f9e95"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.207/workmux-linux-amd64.tar.gz"
      sha256 "050f55bb35ffbd0c759a78f7cd5f03a4cd5de4713570b1c36e88e4d5ece4b181"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
