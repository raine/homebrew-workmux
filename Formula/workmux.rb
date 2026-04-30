class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.192"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.192/workmux-darwin-arm64.tar.gz"
      sha256 "5c342960d41c06980561a7a36cf3cca90630dfc25baace97f8bf46f254a00e84"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.192/workmux-darwin-amd64.tar.gz"
      sha256 "b5cc950221e5b4b118af6a58204dac9734d68f19ff84f1bba2690fd2ca1ef2a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.192/workmux-linux-arm64.tar.gz"
      sha256 "c192f8ba57238c8bd65eedf84fb3aaecb55a4c18e8cc927f763513f9078c717d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.192/workmux-linux-amd64.tar.gz"
      sha256 "0e4f89387301cd2eff2bc1bcda8a43234ed5b659bbf3b46195b1135b52530a9b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
