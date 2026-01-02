class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.65/workmux-darwin-arm64.tar.gz"
      sha256 "c987189e2d3db9b7270477392c657110ef1db9211b04d3ed04dfd55968455361"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.65/workmux-darwin-amd64.tar.gz"
      sha256 "0fff1eccbabf86988df8d9ca7c7b93940c3404b20e07a74de4c046100d95b365"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.65/workmux-linux-arm64.tar.gz"
      sha256 "7cd2fae417b8cb2ecb630fa07bd0bc0a768684f48bccf0353f68319fb318b45c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.65/workmux-linux-amd64.tar.gz"
      sha256 "bb8cc8609622de1e8575d2d80c115a53150ae4384c11fd7d3532f3060451aa0b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
