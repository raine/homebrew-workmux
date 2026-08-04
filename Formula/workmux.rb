class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.234"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.234/workmux-darwin-arm64.tar.gz"
      sha256 "1d948fbfdece89c8e0eacacc43735c51a823fb1e35e060e63fd62f2265fb05ae"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.234/workmux-darwin-amd64.tar.gz"
      sha256 "6820620664c6e0b5d0fd6e4ac9dd262d03a0efbff90bb91747e2d2a4e84ea320"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.234/workmux-linux-arm64.tar.gz"
      sha256 "45c8e6029fc14a86b3a549c1e74a4273ca7e007cd21de62cbdc5577ec0ee60f4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.234/workmux-linux-amd64.tar.gz"
      sha256 "8aa153e07afd568c7a8ac8850254bacd304fbcb93344cdec1fc3d30c1af2f819"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
