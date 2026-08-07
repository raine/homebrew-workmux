class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.235"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.235/workmux-darwin-arm64.tar.gz"
      sha256 "639d54de07f8d478247c730e787686e3d61a3b660c146dff9a01619beb495c7e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.235/workmux-darwin-amd64.tar.gz"
      sha256 "5476ec7a5e8e09de36b8879bc6dc99220ee6c95badc11b61157d0373c600be2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.235/workmux-linux-arm64.tar.gz"
      sha256 "d98c091e69dfca485b412f88be479b008d6003636d871facceff92e29d41a94b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.235/workmux-linux-amd64.tar.gz"
      sha256 "761fa7e5f21afc4952208a11ef62a4ce44cbeafdfddece1db0bc7e937b2b1ca6"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
