class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.263"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.263/workmux-darwin-arm64.tar.gz"
      sha256 "1375ae337c493332ab53d487e06fb1a5b38230d4cf76f81116f3ebc110ff4a7c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.263/workmux-darwin-amd64.tar.gz"
      sha256 "6ff1ebd5abc3ba7b270244028d5a318d7b5368b113ebf76c1242bd81e848fa72"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.263/workmux-linux-arm64.tar.gz"
      sha256 "d657df43432be4ed53f11ae934a1ed8b8dbf2caf8706554dcaddaec52a7b8fc5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.263/workmux-linux-amd64.tar.gz"
      sha256 "6f526155396b062a74d60e9a15b9e87a25ea46a9c032acfc9161a662adc8307b"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
