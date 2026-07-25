class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.226"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.226/workmux-darwin-arm64.tar.gz"
      sha256 "ff912e9f8b35a4a74ee1f98990025d4910ba5a77e13cbe0c6ffcb56b4362a561"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.226/workmux-darwin-amd64.tar.gz"
      sha256 "fbbf7f44ea760f96c8e306137e686b16429ca604bfd9786daff30fe5e8604112"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.226/workmux-linux-arm64.tar.gz"
      sha256 "6996fedd552225b58abb5a311f6b239346a9890d7996baa5793078ae7f67d983"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.226/workmux-linux-amd64.tar.gz"
      sha256 "5a5b604868594c2f166e4a8666916b16c005051e62fc18cf632c7144e5301c2d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
