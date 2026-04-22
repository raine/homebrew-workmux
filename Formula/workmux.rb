class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.185"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.185/workmux-darwin-arm64.tar.gz"
      sha256 "d283e03935f40a9ca279a0fed06b2afa8e570395518b0ccf5040b449e232f790"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.185/workmux-darwin-amd64.tar.gz"
      sha256 "d787f90f897894b16255aace72c5c4b5f00432086371091a6be694abbaaad748"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.185/workmux-linux-arm64.tar.gz"
      sha256 "91855f3b2e47fd6fa2bdb14908a43e4d48ad2f9cc3665d39b9c1d4919815c80d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.185/workmux-linux-amd64.tar.gz"
      sha256 "12b9a3d663b679122ced6f8b2ac85826cbef8d732a7f866bd375ce5f39c4f4fd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
