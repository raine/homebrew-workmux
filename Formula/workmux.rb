class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.214"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.214/workmux-darwin-arm64.tar.gz"
      sha256 "b9a8f8fa8e166633a6e6af06dc608de0536fe2abff6af21e9bef067389f03c2e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.214/workmux-darwin-amd64.tar.gz"
      sha256 "f32451e9b0e851c450ac0f4f282820293272b9b51e3149ffaddb47f07c3ba076"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.214/workmux-linux-arm64.tar.gz"
      sha256 "280647f900cda68b6dea5913a77653bf82fed66b5abbbb25b29587a2ba1a0d64"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.214/workmux-linux-amd64.tar.gz"
      sha256 "e5a68722b2566850f4e86b50745c0e63a482423c22fcbb95c2a8229583b9d55c"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
