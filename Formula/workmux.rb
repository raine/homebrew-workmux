class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.174"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.174/workmux-darwin-arm64.tar.gz"
      sha256 "786cdbaff199b541ffae862ca16361862f578f5fd1eb18cb57c24827b5bcc763"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.174/workmux-darwin-amd64.tar.gz"
      sha256 "a392322b071b1a5763d761ef3d2258f2dad8c9ea195a19c90df651bc7e6a94ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.174/workmux-linux-arm64.tar.gz"
      sha256 "4f613c2d200232a9fc20c912fd5e6439360739c79f022d82dc399a34f21ace55"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.174/workmux-linux-amd64.tar.gz"
      sha256 "319e5620d0b517253fe3f3207204b204b1bdd7d85530afb3d84e49e87b56ddae"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
