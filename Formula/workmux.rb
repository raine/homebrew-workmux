class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.277"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.277/workmux-darwin-arm64.tar.gz"
      sha256 "14684a56c06bccb32d03186be5282e6f5ca24acd037996da439bb12e97c4c285"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.277/workmux-darwin-amd64.tar.gz"
      sha256 "ac7db345d45ef3c1a23c29f647c2ce47d4f3f32ef9096da76d1afa23ba67d116"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.277/workmux-linux-arm64.tar.gz"
      sha256 "795b7f7b5d8c66b84f56f00549697e30d9f0b0b8d3373b6fbf422d6f229222ca"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.277/workmux-linux-amd64.tar.gz"
      sha256 "55c0144c79b55881d7210cbcc6278ce6b64b7a66317959d251140309aef73064"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
