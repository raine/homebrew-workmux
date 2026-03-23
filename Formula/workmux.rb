class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.146"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.146/workmux-darwin-arm64.tar.gz"
      sha256 "b457075ae8563e3786ba8734cbc2ad0f34addad0b9aec74ce9b3a5f914e77a2d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.146/workmux-darwin-amd64.tar.gz"
      sha256 "58dfcd03ca15ffd2bae35032be09996d658d822e4c00ca2b35e6dbab4449d147"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.146/workmux-linux-arm64.tar.gz"
      sha256 "6e1c670bee94bd0ac3232b1749d6bfdc93fae5fc151850f0953434587f0bf41a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.146/workmux-linux-amd64.tar.gz"
      sha256 "7bbbcc62dafa9610f27cf0edf39702296b67d3a48aaa2e0aff6e630d9defd720"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
