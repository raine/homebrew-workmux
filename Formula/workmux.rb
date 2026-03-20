class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.142"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.142/workmux-darwin-arm64.tar.gz"
      sha256 "081b739a0b6ff2aaa20ede1b148dd7be06be6cd1ccee77c3fbc6ca6f2c50f6db"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.142/workmux-darwin-amd64.tar.gz"
      sha256 "91417882e1efc8f2833cd23d0072f31b02c0bfb5cf451fae6ba2f69701111cf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.142/workmux-linux-arm64.tar.gz"
      sha256 "8dac15f305d327fc45a6dff278f10fda09c82b73c9b67f939a0bfabbb1ab18c7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.142/workmux-linux-amd64.tar.gz"
      sha256 "50fbf657f4133f5c5815f53583b69786c2ca07e4401e9d16cfef0cd03fa17a12"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
