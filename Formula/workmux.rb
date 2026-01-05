class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.68/workmux-darwin-arm64.tar.gz"
      sha256 "fe06fd4f711de515b15fcb30676f5201a8e449b867788e083ccb1b6617e0927c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.68/workmux-darwin-amd64.tar.gz"
      sha256 "24c45bd6954db0dc43f8747b0010a4e91df4e73524fc749400d6d4668d212bca"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.68/workmux-linux-arm64.tar.gz"
      sha256 "8ada6420f72190fdecc5958ff84850dddaab96c5396e81b18ef8d9f2e0d67642"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.68/workmux-linux-amd64.tar.gz"
      sha256 "cc1969993b18ada2ec8bef899d74d8db4b8dd5c570eefc2bb27216cfb5adbdfa"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
