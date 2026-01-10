class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.83"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.83/workmux-darwin-arm64.tar.gz"
      sha256 "ddf5d7702484dbce61c134deac9e3a4f285ad83082e698db05151be9a4145a0a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.83/workmux-darwin-amd64.tar.gz"
      sha256 "abdc00f32e8379cd8d0beed3fc844f3a2e8da06551a8b3f39ca56271be5dbd09"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.83/workmux-linux-arm64.tar.gz"
      sha256 "34ebadf92dbaf2df5da2829381a7ff5ca554c8197549ba6f6672479bd03b3e2e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.83/workmux-linux-amd64.tar.gz"
      sha256 "53571a833d25a3c56b8a62c6b0f4196fc7820a2ec91cb4b11fa84fd469f4f719"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
