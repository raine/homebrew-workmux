class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.194"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.194/workmux-darwin-arm64.tar.gz"
      sha256 "81bc57258026623504e4a165c9fea7b00e315035b859095332a3296487cc695c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.194/workmux-darwin-amd64.tar.gz"
      sha256 "9073848e19a51fffc69fd5d5742de98331a78917552b6fe1ed2d5815dabbe77f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.194/workmux-linux-arm64.tar.gz"
      sha256 "db6cfaf153aeb80e18104accf5aa2796bc24366047da1ec95f537ccb3e2d483b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.194/workmux-linux-amd64.tar.gz"
      sha256 "4123b6c326120a66499205e57918377e45e650bc1d1b28e69dd20db46e010072"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
