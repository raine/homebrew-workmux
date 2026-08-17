class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.239"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.239/workmux-darwin-arm64.tar.gz"
      sha256 "0915e67834f3b7ef3d6ae5d0ad69da32dbdeded233a8272bacf2f664f0e66cfc"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.239/workmux-darwin-amd64.tar.gz"
      sha256 "88ed802081ad41ee8150119acbc5411aee1857fe3bfd5a5afa347932a3acb599"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.239/workmux-linux-arm64.tar.gz"
      sha256 "47024c8889c52816208247bb5d8764663e4f950ee5df4ccaad4be26e28e21c25"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.239/workmux-linux-amd64.tar.gz"
      sha256 "100b39126a257062ff9cf30be53ac3f323378cb92a5cfe1e9fe8fcc242a9a31c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
