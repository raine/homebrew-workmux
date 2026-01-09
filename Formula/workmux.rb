class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.80"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.80/workmux-darwin-arm64.tar.gz"
      sha256 "d117b425d4e37a46f1d074677d5e79333d45d2c495a500d4d8b606874efffd51"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.80/workmux-darwin-amd64.tar.gz"
      sha256 "b10347bdbccce917ec7f57b6cb6e4dac1bb5484d1680fe131743f2a5e9ca5aaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.80/workmux-linux-arm64.tar.gz"
      sha256 "4860e92f0b7e9fc9fc4667eccc3451889fe7e8c4eeac2c316c6f3c380257919c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.80/workmux-linux-amd64.tar.gz"
      sha256 "04d8fe49243b4b62fbdaee0176b87a719320a245e1051c2eb88c9369f8b5736d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
