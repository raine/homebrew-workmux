class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.163"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.163/workmux-darwin-arm64.tar.gz"
      sha256 "0f0d674a5edc8a22a6abcc6ced2cf11b99ba0ee03ce7353c6c6f65260bcef097"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.163/workmux-darwin-amd64.tar.gz"
      sha256 "e4294f388c0d82996dac9a583b7f8b5477a3a2fe6637d74a122c174937ab19b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.163/workmux-linux-arm64.tar.gz"
      sha256 "ec267aad559b615c6a9d2de7d8c8dc5f77e21fa10d4669f22454542b4c2763da"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.163/workmux-linux-amd64.tar.gz"
      sha256 "efa96bbdb5a30b6f954660fd0c4dc7fe541b65032b8eced494e18bb13398861a"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
