class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.248"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.248/workmux-darwin-arm64.tar.gz"
      sha256 "b3150179e6f7732473dc5762381cbbee9d4ac46a89ff6b5c0de4aa9b62eb789b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.248/workmux-darwin-amd64.tar.gz"
      sha256 "bfe9aebbfeb6b8abc3aa663896b567d5d77c4c8505746fb38b3b4eefc59b90f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.248/workmux-linux-arm64.tar.gz"
      sha256 "593fca37a19f312be6908ee860748d379ad2ea982676d97a5c78dea6a83021be"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.248/workmux-linux-amd64.tar.gz"
      sha256 "e048789449314644bfdbc1e03a661f9e11c8439d42beeb730833e5e51078e7c1"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
