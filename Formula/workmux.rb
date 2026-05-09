class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.204"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.204/workmux-darwin-arm64.tar.gz"
      sha256 "b2c51a91c942305c1eef699f6b0f142069f2a83944067b984021bf230644f8c5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.204/workmux-darwin-amd64.tar.gz"
      sha256 "bdf7be5f321266c69625563809761d0c33db62092a95672ada5ffc84221ebf44"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.204/workmux-linux-arm64.tar.gz"
      sha256 "992e8d6462f8a9d585d1b64286ab249d50f8c25fbb05fb090fb433c9a5b4bf71"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.204/workmux-linux-amd64.tar.gz"
      sha256 "7c5e570d3ec075287d101bf89aa51a4dd22ee5030edfb9c3915535194ad982ad"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
