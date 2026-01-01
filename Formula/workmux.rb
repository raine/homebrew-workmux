class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.0.0-test"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.0.0-test/aarch64-apple-darwin.tar.gz"
      sha256 "f28e5732c226dd70027953bc5e4daa74a38ed61625b8830caf239c5532cbdeee"
    else
      url "https://github.com/raine/workmux/releases/download/v0.0.0-test/x86_64-apple-darwin.tar.gz"
      sha256 "cc9895ca4f72a5f9eecdd0749d4fbaddf150cbc98ec7fdb147cce06b3b42f744"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.0.0-test/aarch64-unknown-linux-musl.tar.gz"
      sha256 "a7a35758e22b084231d62571119b952edf7f01bc1620ae638868c43e4f623877"
    else
      url "https://github.com/raine/workmux/releases/download/v0.0.0-test/x86_64-unknown-linux-musl.tar.gz"
      sha256 "0d70b62d716b86996e4cbb753fbf672125b45cca0b93ea4648bbce1d9ed14935"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
