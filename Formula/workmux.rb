class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.212"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.212/workmux-darwin-arm64.tar.gz"
      sha256 "7b4f198d74744cdb8b530b68d1f3e1291aea0f41103ec4b004fff2d112b481cf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.212/workmux-darwin-amd64.tar.gz"
      sha256 "f7558974b1469f84c99ff4523bb5c06087c343ee6f75de389a4c67ee46037a78"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.212/workmux-linux-arm64.tar.gz"
      sha256 "bd701d92d3ed8de0b28bcd9204b4beab8bb66a8d8cb07eacf27c6bef6200e9a3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.212/workmux-linux-amd64.tar.gz"
      sha256 "79a3523826ad24bd4c3c350f83a62da0288d01fca38f4b97f095cf2c988376b4"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
