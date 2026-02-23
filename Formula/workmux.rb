class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.121"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.121/workmux-darwin-arm64.tar.gz"
      sha256 "239ad4817d53027c03584801621088dac24d7329b06bb930b4dd8f3a1bbe2025"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.121/workmux-darwin-amd64.tar.gz"
      sha256 "cec3dd81a03f9d27f1b893cb92bb3d8be1f754ab33f80a6af93d21d0a19d7615"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.121/workmux-linux-arm64.tar.gz"
      sha256 "95952b9441c80a1958bdc2d07109903cc08ce698bb462baace317c1dbe9d6f50"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.121/workmux-linux-amd64.tar.gz"
      sha256 "a1a9a5e9e598943b7eab21f6cd1970d0766b8203d76607abacac45775371f9d8"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
