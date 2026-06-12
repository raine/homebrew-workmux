class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.213"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.213/workmux-darwin-arm64.tar.gz"
      sha256 "a8cf8c7b28e62e83a7eca9d512f989c8e9615d7c06e6f4b15f587e69fcde8651"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.213/workmux-darwin-amd64.tar.gz"
      sha256 "284343370a3890714e73650885f0e46302de543e27598ca84d807c86175b5d2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.213/workmux-linux-arm64.tar.gz"
      sha256 "e99ecd7d6899282ae1dbd5e4c4ef8f270d98e8aa16f218e0c4d800fea479a898"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.213/workmux-linux-amd64.tar.gz"
      sha256 "a0046dc6438eda7c9851fd5c6cfeba1b426aa85a23f79440a9ba65ab2e43ee1c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
