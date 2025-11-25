class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.27/aarch64-apple-darwin.tar.gz"
      sha256 "b319afbe2f111b5eb43a42038a2106a5522f05bb2ec7c752ac4991888b85a6d2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.27/x86_64-apple-darwin.tar.gz"
      sha256 "7cc1e23c562f4436a610480fa4c325180c468c9742386b5c05cb81493cf0294e"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.27/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40c7ae3a6590cc9d93855d3137d10b1afa9b4d2cbbe13cfc6b803b6ea732767a"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workmux --version")
  end
end
