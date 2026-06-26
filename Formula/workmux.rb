class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.215"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.215/workmux-darwin-arm64.tar.gz"
      sha256 "306a6e1ded4dbc6bb5c4e02f571ac682f0e84fd8ec354ac8d10e6a977e37891d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.215/workmux-darwin-amd64.tar.gz"
      sha256 "8b415f0882c12c8aff21586ef606ebf67ec3abe61a08f7d16699495cc9228964"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.215/workmux-linux-arm64.tar.gz"
      sha256 "0b3d1e8a7c423754097965822367a487a1a7ae8e016b5d0cbf652fab83f5e262"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.215/workmux-linux-amd64.tar.gz"
      sha256 "b79227cc46b22a44a414bcc6b3e53788ce306fc77c515f20cb55e020402c77d3"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
