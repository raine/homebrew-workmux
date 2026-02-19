class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.118"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.118/workmux-darwin-arm64.tar.gz"
      sha256 "950fe5d36de0b50b0d55c177f86f8cea2821a6e96b840cb3de4435d7f0a18b39"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.118/workmux-darwin-amd64.tar.gz"
      sha256 "2893ba4e7d8de86281a1c522408b1b54c5726e356c548156f17247166fd17da3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.118/workmux-linux-arm64.tar.gz"
      sha256 "c64aa5cebc66d844dc6dca58ac6e589c6709e0f83a2b046db99a0d8164c8aefe"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.118/workmux-linux-amd64.tar.gz"
      sha256 "8df16d60b853f943014b2c88bdab956bbc204ef3ef4dff9d9035b46e95931791"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
