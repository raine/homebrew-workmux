class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.66/workmux-darwin-arm64.tar.gz"
      sha256 "56af648470c2d71e9e67f735885a956cd36b306b0fed9d05d61db9eeb0539434"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.66/workmux-darwin-amd64.tar.gz"
      sha256 "e1dbd4e385f70c2e101f17a1455b1587afd44cba1fcec8c71a0942d4b5cf91f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.66/workmux-linux-arm64.tar.gz"
      sha256 "910b0542b642b676592c9773188a7aff45305828608b7fa20f9a926d1f719c2d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.66/workmux-linux-amd64.tar.gz"
      sha256 "309a2da521ad1a65bd700aed538ea88cc710e2ab4c602b176d2430c2ab00d28c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
