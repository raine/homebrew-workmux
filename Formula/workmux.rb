class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.225"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.225/workmux-darwin-arm64.tar.gz"
      sha256 "4455a53f01924c65f55bfbbca39aa686475550aefecd95e4c65f69fd536da19d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.225/workmux-darwin-amd64.tar.gz"
      sha256 "4192680bcf9eb977b9beb8fe026145defb2ece457d87e3d25c7d43f7d3577af1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.225/workmux-linux-arm64.tar.gz"
      sha256 "708da88d9a2c9f2148ba371322eb49857391ffffe67876b484edc466dbe69a1d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.225/workmux-linux-amd64.tar.gz"
      sha256 "e6b1e8ba761c84eebec072f267381f8305d067cd89815dad02704ea5d26b1760"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
