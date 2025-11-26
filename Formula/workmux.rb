class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.29/aarch64-apple-darwin.tar.gz"
      sha256 "8b069460ff54ff36078cb0fe345dd59ccf958a61bdd3e762ddc2680b250c6100"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.29/x86_64-apple-darwin.tar.gz"
      sha256 "8d22047b1274943a89a78a82d581ffffce6c4ea64a17e3ba97c666da8cfb68b6"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.29/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3c6b49fac428c4ad25c91a9a838ff78d54871e4f0de7791170040ab9bf11187e"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
