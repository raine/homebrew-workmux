class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.90"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.90/workmux-darwin-arm64.tar.gz"
      sha256 "8e1b3a70fe2f127e0f218d4d552408aeb84ad544f7c51926809c2e3460200f8f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.90/workmux-darwin-amd64.tar.gz"
      sha256 "01305d7d4d70697f6382ed9ef62533f06d3c78e62cc725b7bdc788ce0d52188a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.90/workmux-linux-arm64.tar.gz"
      sha256 "2195ac4b4360150f18e4f9b87a0b59afce43d9aca5dbbf7a7da30d04b8e2cc7a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.90/workmux-linux-amd64.tar.gz"
      sha256 "38e91e9f58eeda7f44322d7902e4381db0c41e48ae543e55937ce29d61db7b5e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
