class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.182"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.182/workmux-darwin-arm64.tar.gz"
      sha256 "8f278d94d78046ea897ad53d5e48ddeb326d1647dde39c74619bf9dc496a76c3"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.182/workmux-darwin-amd64.tar.gz"
      sha256 "e9b0edd8588077188f6ebe1aa439c293790dedec98b18b8eb4e40eb58c1f74e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.182/workmux-linux-arm64.tar.gz"
      sha256 "eddb53e596ccba6eadbc3d2c69c9f78036bf273807be212d4aa7df7d65b46785"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.182/workmux-linux-amd64.tar.gz"
      sha256 "1dfe74340908207dd55754078e695bcd2c7f1d9574032880674753f4d816d015"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
