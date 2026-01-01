class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.63/aarch64-apple-darwin.tar.gz"
      sha256 "45db76307c3acbdd173ed802ad753fda722acff474fabeb9feb576e3acd11590"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.63/x86_64-apple-darwin.tar.gz"
      sha256 "0c65a41dade444732be4a48959ef27d29c19f3bff6b84db023326706d99c697e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.63/aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2cec8e778eabaea0e721fc925b0680061ebbf4953bc185bf4efb10ea158813c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.63/x86_64-unknown-linux-musl.tar.gz"
      sha256 "3e7ef1a0313a0e3fc8f4d21d0dcdec5b816769b698fb7dbaa9eccf3406574898"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
