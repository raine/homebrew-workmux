class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.72"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.72/workmux-darwin-arm64.tar.gz"
      sha256 "bc1a4a4aa291e096100bec7822c051ed5160fcebff0cd8d438ac546b8d0de3cf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.72/workmux-darwin-amd64.tar.gz"
      sha256 "a240c2caf8f6348b42ce17a9aa84eefef9bbd7a36b1e70e1915ab0b6c1c5d739"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.72/workmux-linux-arm64.tar.gz"
      sha256 "bd6ed8ab20947cc8511974cb8661b32b78940feba66888d049f58f136e7cf83b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.72/workmux-linux-amd64.tar.gz"
      sha256 "1f86b7410bc89a367cf166ffc67dac6c3b109f558f5e4f01e93f434d76f9d30a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
