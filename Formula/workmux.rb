class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.170"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.170/workmux-darwin-arm64.tar.gz"
      sha256 "a07d1b07644b7e870c3348ba4303adf3e9494c54f072b71ac4781fcad1567106"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.170/workmux-darwin-amd64.tar.gz"
      sha256 "286abf6c70725264a2d152898e5fee0e75262bfb41dc34312e7c215f772d0883"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.170/workmux-linux-arm64.tar.gz"
      sha256 "24545e65c495706d12311e5d7dc63b1252b54d10ecdd78cb0858e5e818e8aace"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.170/workmux-linux-amd64.tar.gz"
      sha256 "e08d58cde2feef4ae854a2df9181204f076e9a9a945008e92ea3d8d1ce3b8173"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
